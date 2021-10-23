import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    var photoImageView = UIImageView()
    var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PhotoTableViewCell: ViewCodeConfiguration {
    
    func buildViewHierarchy() {
        
        self.contentView.addSubview(photoImageView)
        self.contentView.addSubview(titleLabel)
        
    }
    
    func setupConstraints() {
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 60).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: -16).isActive = true
        
    }
    
    func configureViews() {
        
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.clipsToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textAlignment = .natural
        titleLabel.numberOfLines = 5
        titleLabel.baselineAdjustment = .alignBaselines
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.contentMode = .left
        
    }
    
}
