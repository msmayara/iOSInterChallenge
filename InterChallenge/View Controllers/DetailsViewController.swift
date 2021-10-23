import UIKit

class DetailsViewController: UIViewController {

    var detailImageView = UIImageView()
    var nameLabel = UILabel()
    
    var photo = UIImage()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = photo
        nameLabel.text = name
    }
}
