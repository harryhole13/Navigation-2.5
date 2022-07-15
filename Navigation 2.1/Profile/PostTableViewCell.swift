//
//  PostTableViewCell.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 06.07.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        name.textColor = .black
        name.numberOfLines = 2
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    
    private lazy var postImage:UIImageView =  {
        
        let image = UIImageView(image: UIImage())
        image.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 70, height: 70))
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionPost:UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionPost.textColor = .systemGray
        descriptionPost.numberOfLines = 0
        descriptionPost.backgroundColor = .white
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionPost
    }()
    
    private lazy var stackLikesAndViews:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var numberLikes: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        name.textColor = .black
        name.numberOfLines = 1
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var numberViews: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        name.textColor = .black
        name.numberOfLines = 1
        name.textAlignment = .right
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var screenSize = UIScreen.main.bounds
    private lazy var  screenWidth = screenSize.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    private func setupView() {
        self.addSubview(stackView)
        self.stackLikesAndViews.addArrangedSubview(numberLikes)
        self.stackLikesAndViews.addArrangedSubview(numberViews)
        self.stackView.addArrangedSubview(nameLabel)
        self.stackView.addArrangedSubview(postImage)
        self.stackView.addArrangedSubview(descriptionPost)
        self.stackView.addArrangedSubview(stackLikesAndViews)
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.nameLabel.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -12),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.postImage.heightAnchor.constraint(equalToConstant: screenWidth),
            self.postImage.bottomAnchor.constraint(equalTo: self.descriptionPost.topAnchor, constant: -16),
            
            self.descriptionPost.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.descriptionPost.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.descriptionPost.bottomAnchor.constraint(equalTo: self.stackLikesAndViews.topAnchor, constant: -16),
            
            self.stackLikesAndViews.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.stackLikesAndViews.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.stackLikesAndViews.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
        ])
        
    }
    
    func setup(with post: Post) {
        self.nameLabel.text = post.author
        self.postImage.image = UIImage(named: post.image)
        self.descriptionPost.text = post.description
        self.numberLikes.text = "Likes: " + String(post.likes)
        self.numberViews.text = "Views: " + String(post.views)
        
    }

}
