import UIKit

class DetailsViewController: UIViewController {

    var detailImageView = UIImageView()
    var nameLabel = UILabel()
    
    var photo = UIImage()
    var name = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
    }
}

extension DetailsViewController: ViewCodeConfiguration {
    func buildViewHierarchy() {
        self.view.addSubview(detailImageView)
        self.view.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -24).isActive = true
        detailImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -24).isActive = true
    }
    
    func configureViews() {

        nameLabel.text = name
        
        detailImageView.image = photo
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.clipsToBounds = true
        
    }
    
    
    
    
}
