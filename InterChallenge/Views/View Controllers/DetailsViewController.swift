import UIKit

class DetailsViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?

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
        
        detailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
    }
    
    func configureViews() {

        self.view.backgroundColor = .white
        
        nameLabel.text = name
        nameLabel.font = .systemFont(ofSize: 17)
        nameLabel.textAlignment = .natural
        nameLabel.numberOfLines = 0
        nameLabel.baselineAdjustment = .alignBaselines
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.contentMode = .left
        
        detailImageView.image = photo
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.clipsToBounds = true
    }

}
