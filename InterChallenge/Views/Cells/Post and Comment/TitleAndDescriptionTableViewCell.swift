import UIKit

class TitleAndDescriptionTableViewCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        applyViewCode()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TitleAndDescriptionTableViewCell: ViewCodeConfiguration {
    
    func buildViewHierarchy() {
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
    }
    
    func configureViews() {
        
        self.contentView.contentMode = .center
        self.contentView.clipsToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 21)
        titleLabel.textAlignment = .natural
        titleLabel.numberOfLines = 2
        titleLabel.baselineAdjustment = .alignBaselines
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.contentMode = .left
        
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.textAlignment = .natural
        descriptionLabel.numberOfLines = 0
        descriptionLabel.baselineAdjustment = .alignBaselines
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.contentMode = .left
        
    }
}
