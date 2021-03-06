import Alamofire
import UIKit

class ChallengeViewController: UITableViewController {
    
    weak var coordinator: AppCoordinator?
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Desafio"
        
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        fillUsers()
    }
    
    private func fillUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users").validate().responseJSON { response in
            guard response.error == nil else {
                self.displayErrorAlert()
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([User].self, from: data)
                    self.users = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
    }
}

extension ChallengeViewController: UserTableViewCellDelegate {
    
    func didTapAlbums(with userId: Int, by name: String) {
        self.coordinator?.goToAlbums(with: userId, by: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        self.coordinator?.goToPosts(with: userId, by: name)
    }
}
