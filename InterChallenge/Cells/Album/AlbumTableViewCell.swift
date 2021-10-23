import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    var albumNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AlbumTableViewCell: ViewCodeConfiguration {
    
    func buildViewHierarchy() {
        
        self.contentView.addSubview(albumNameLabel)
    }
    
    func setupConstraints() {
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        albumNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
    
    }
    
    func configureViews() {
        
        albumNameLabel.font = .systemFont(ofSize: 17)
        albumNameLabel.numberOfLines = 0
        albumNameLabel.textAlignment = .natural
        albumNameLabel.contentMode = .left
        albumNameLabel.baselineAdjustment = .alignBaselines
        albumNameLabel.lineBreakMode = .byTruncatingTail
        
    }
}
