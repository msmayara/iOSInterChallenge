import Alamofire
import UIKit

class CommentTableViewController: UITableViewController {
    
    var postId = Int()
    var userName = String()
    var comments = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comentários de \(userName)"
        tableView.register(TitleAndDescriptionTableViewCell.self,
                           forCellReuseIdentifier: "TitleAndDescriptionCell")
        fillComments(from: postId)
    }
    
    private func fillComments(from postId: Int) {
        AF.request("https://jsonplaceholder.typicode.com/comments?postId=\(postId)").validate().responseJSON { response in
            guard response.error == nil else {
                self.displayErrorAlert()
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Comment].self, from: data)
                    self.comments = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
   }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
   }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as? TitleAndDescriptionTableViewCell else {
            return UITableViewCell()
        }

        let comment = comments[indexPath.row]
        cell.selectionStyle = .none
        cell.titleLabel.text = comment.name
        cell.descriptionLabel.text = comment.body

        return cell
    }
}
