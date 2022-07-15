//
//  ProfileHeaderView.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 12.06.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {

    private var rectangle = 100   //размер авы
    
    private lazy var buttonStatus: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Install status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Homelander"
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return title
    }()
    
    private lazy var stackNameWithStatus: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.backgroundColor = .gree
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var setStatus: UITextField = {
        let setStatus = UITextField()
        setStatus.translatesAutoresizingMaskIntoConstraints = false
        setStatus.placeholder =  "Write your status"
        setStatus.clearButtonMode = .whileEditing
        setStatus.backgroundColor = .white
        setStatus.clipsToBounds = true
        setStatus.layer.cornerRadius = 12
        setStatus.layer.borderWidth = 1
        setStatus.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        setStatus.font = .systemFont(ofSize: 15, weight: .regular)
        setStatus.textColor = .black
        return setStatus
    }()
    
    private var statusText = "Inhuman fucking monster" //первичный статус
            
    private lazy var titleStatus: UILabel = {
        var title = UILabel()
        title.text = statusText
        title.textColor = UIColor.gray
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return title
    }()

    private lazy var avatarImageView: UIImageView = {
        let picture = UIImage(named: "homelander")
        let avatarView = UIImageView(image: UIImage(named: "Homelander"))
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.clipsToBounds = true
        avatarView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        avatarView.layer.borderWidth = 3
        avatarView.contentMode = .scaleAspectFill
        avatarView.layer.cornerRadius = CGFloat(rectangle) / 2
        return avatarView
    }()
    
    override init(reuseIdentifier : String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func pressButton() {
        if setStatus.text?.isEmpty == true {
            self.titleStatus.text = "No status"
        } else {
        self.titleStatus.text = setStatus.text
        self.animateButton(view: buttonStatus)
        }
    }
    
    private func animateButton(view viewToAnimate: UIView) {
        
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { _ in
            
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    private func setupView(){
        self.backgroundColor = .yellow
        self.addSubview(avatarImageView)
        self.addSubview(stackNameWithStatus)
        self.addSubview(buttonStatus)
        self.addSubview(setStatus)
        self.stackNameWithStatus.addArrangedSubview(titleName)
        self.stackNameWithStatus.addArrangedSubview(titleStatus)

        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: CGFloat(rectangle)) ,
            self.avatarImageView.heightAnchor.constraint(equalToConstant: CGFloat(rectangle)),
            
            self.stackNameWithStatus.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.stackNameWithStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.stackNameWithStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            self.stackNameWithStatus.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -20),
            
            self.setStatus.topAnchor.constraint(equalTo: stackNameWithStatus.bottomAnchor),
            self.setStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatus.leadingAnchor.constraint(equalTo: self.stackNameWithStatus.leadingAnchor),
            self.setStatus.heightAnchor.constraint(equalToConstant: 40),
            
            self.buttonStatus.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            self.buttonStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.buttonStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}




