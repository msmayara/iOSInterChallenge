import Alamofire
import UIKit

class PhotoTableViewController: UITableViewController {
    
    weak var coordinator: AppCoordinator?
    
    var albumId = Int()
    var userName = String()
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fotos de \(userName)"
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        fillPhotos(from: albumId)
    }
    
    private func fillPhotos(from albumId: Int) {
        AF.request("https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)").validate().responseJSON { response in
            guard response.error == nil else {
                self.displayErrorAlert()
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Photo].self, from: data)
                    self.photos = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title

        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        AF.download(photo.url).responseData { response in
            switch response.result {
            case .success(let data):

                let detailsViewController = DetailsViewController()
                detailsViewController.photo = UIImage(data: data)!
                detailsViewController.name = photo.title
                self.navigationController?.pushViewController(detailsViewController, animated: true)

            default:
                break
            }
        }
    }
}
