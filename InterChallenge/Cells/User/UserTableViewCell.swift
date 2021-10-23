import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    var initialsLabel = UILabel()
    var nameLabel = UILabel()
    var userNameLabel = UILabel()
    var emailLabel = UILabel()
    var phoneLabel = UILabel()
    
    var initialsView = UIView()
    var separatorView = UIView()
    var stackView = UIStackView()
    
    var albumsButton = UIButton()
    var postsButton = UIButton()
    
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
    
    @objc func albumsAction(sender: UIButton!) {
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction(sender: UIButton!) {
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
}

extension UserTableViewCell: ViewCodeConfiguration {
    
    func buildViewHierarchy() {
        
        self.contentView.addSubview(initialsView)
        self.initialsView.addSubview(initialsLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(separatorView)
        self.contentView.addSubview(userNameLabel)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(phoneLabel)
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(albumsButton)
        self.stackView.addArrangedSubview(postsButton)
        
    }
    
    func setupConstraints() {
        
        initialsView.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        albumsButton.translatesAutoresizingMaskIntoConstraints = false
        albumsButton.translatesAutoresizingMaskIntoConstraints = false
        
        initialsView.widthAnchor.constraint(equalToConstant: 88).isActive = true
        initialsView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        initialsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        initialsView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        
        initialsLabel.trailingAnchor.constraint(equalTo: initialsView.trailingAnchor).isActive = true
        initialsLabel.topAnchor.constraint(equalTo: initialsView.topAnchor).isActive = true
        initialsLabel.bottomAnchor.constraint(equalTo: initialsView.bottomAnchor).isActive = true
        initialsLabel.leadingAnchor.constraint(equalTo: initialsView.leadingAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: initialsView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -32).isActive = true
        
        separatorView.leadingAnchor.constraint(equalTo: initialsView.trailingAnchor, constant: 32).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: initialsView.trailingAnchor, constant: 32).isActive = true
        
        userNameLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        
        stackView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 64).isActive = true
        stackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func configureViews() {
        
        self.contentView.contentMode = .center
        self.contentView.clipsToBounds = true
        
        initialsView.contentMode = .scaleToFill
        initialsView.backgroundColor = .systemYellow
        
        initialsLabel.text = "initials"
        initialsLabel.font = .systemFont(ofSize: 17)
        initialsLabel.textAlignment = .center
        initialsLabel.numberOfLines = 0
        initialsLabel.baselineAdjustment = .alignBaselines
        initialsLabel.lineBreakMode = .byTruncatingTail
        initialsLabel.contentMode = .left
        
        nameLabel.text = "name"
        nameLabel.font = .systemFont(ofSize: 17)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.baselineAdjustment = .alignBaselines
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.contentMode = .left
        
        userNameLabel.text = "username"
        userNameLabel.font = .systemFont(ofSize: 17)
        userNameLabel.textAlignment = .natural
        userNameLabel.numberOfLines = 0
        userNameLabel.baselineAdjustment = .alignBaselines
        userNameLabel.lineBreakMode = .byTruncatingTail
        userNameLabel.contentMode = .left
        
        emailLabel.text = "email"
        emailLabel.font = .systemFont(ofSize: 17)
        emailLabel.textAlignment = .natural
        emailLabel.numberOfLines = 0
        emailLabel.baselineAdjustment = .alignBaselines
        emailLabel.lineBreakMode = .byTruncatingTail
        emailLabel.contentMode = .left
        
        phoneLabel.text = "phone"
        phoneLabel.font = .systemFont(ofSize: 17)
        phoneLabel.textAlignment = .natural
        phoneLabel.numberOfLines = 0
        phoneLabel.baselineAdjustment = .alignBaselines
        phoneLabel.lineBreakMode = .byTruncatingTail
        phoneLabel.contentMode = .left
        
        separatorView.contentMode = .scaleToFill
        separatorView.backgroundColor = .lightGray
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.contentMode = .scaleToFill
        
        albumsButton.setTitle("ÁLBUNS", for: .normal)
        albumsButton.setTitleColor(.systemOrange, for: .normal)
        albumsButton.titleLabel?.font = .systemFont(ofSize: 15)
        albumsButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
        albumsButton.contentHorizontalAlignment = .center
        albumsButton.contentVerticalAlignment = .center
        albumsButton.contentMode = .scaleToFill
        albumsButton.addTarget(self, action: #selector(albumsAction(sender:)), for: .touchUpInside)

        postsButton.setTitle("POSTAGENS", for: .normal)
        postsButton.setTitleColor(.systemOrange, for: .normal)
        postsButton.titleLabel?.font = .systemFont(ofSize: 15)
        postsButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
        postsButton.contentHorizontalAlignment = .center
        postsButton.contentVerticalAlignment = .center
        postsButton.contentMode = .scaleToFill
        postsButton.addTarget(self, action: #selector(postsAction(sender:)), for: .touchUpInside)
        
    }
    
}
