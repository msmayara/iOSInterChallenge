import Alamofire
import UIKit

class AlbumTableViewController: UITableViewController {
    
    weak var coordinator: AppCoordinator?

    var userId = Int()
    var userName = String()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Álbuns de \(userName)"
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        fillAlbums(from: userId)
    }
    
    private func fillAlbums(from userId: Int) {
        AF.request("https://jsonplaceholder.typicode.com/albums?userId=\(userId)").validate().responseJSON { response in
            guard response.error == nil else {
                self.displayErrorAlert()
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Album].self, from: data)
                    self.albums = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }

        let album = albums[indexPath.row]
        cell.albumNameLabel.text = album.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = albums[indexPath.row].id
        self.coordinator?.goToPhotos(with: albumId, by: userName)
    }
}
