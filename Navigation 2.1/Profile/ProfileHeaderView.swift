//
//  ProfileHeaderView.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 12.06.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private lazy var profileView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        return profileView        
    }()
    
    private lazy var buttonStatus: UIButton = {
        let button = UIButton()
        //button.clipsToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        //button.titleLabel?.textColor = UIColor.black  // why not working ((((
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Homelander"
        //title.textAlignment = .center
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return title
    }()
    
    private lazy var stackNameWithStatus: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .lightGray
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var setStatus: UITextField = {   //дополнительное задание со звездой
        let setStatus = UITextField()
        setStatus.translatesAutoresizingMaskIntoConstraints = false
        setStatus.backgroundColor = .white
        setStatus.clipsToBounds = true
        setStatus.layer.cornerRadius = 12
        setStatus.layer.borderWidth = 1
        setStatus.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        setStatus.font = .systemFont(ofSize: 15, weight: .regular)
        setStatus.textColor = .black
        setStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return setStatus
    }()
    
    private var statusText = "Inhuman fucking monster"
        
    private lazy var titleStatus: UILabel = {
        var title = UILabel()
        title.text = statusText
        //title.textAlignment = .center
        title.textColor = UIColor.gray
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return title
    }()

    private lazy var avatarView: UIImageView = {
        let picture = UIImage(named: "homelander")
        let avatarView = UIImageView(image: UIImage(named: "Homelander"))
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.clipsToBounds = true
        avatarView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        avatarView.layer.borderWidth = 3
        avatarView.contentMode = .scaleAspectFill
        //avatarView.backgroundColor = .red
        return avatarView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatarView.layer.cornerRadius = self.avatarView.frame.height / 2
    }
    
    @objc private func buttonPressed() {
        titleStatus.text = statusText
        self.animateButton(view: buttonStatus)
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
    

    
    @objc func statusTextChanged() {
        statusText = setStatus.text ?? ""
        print(statusText)
    }
    
    private func setupView(){
        self.backgroundColor = .lightGray
        self.addSubview(avatarView)
        self.addSubview(stackNameWithStatus)
        self.addSubview(buttonStatus)
        self.addSubview(setStatus)
        self.stackNameWithStatus.addArrangedSubview(titleName)
        self.stackNameWithStatus.addArrangedSubview(titleStatus)

        NSLayoutConstraint.activate([
            self.avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarView.widthAnchor.constraint(equalToConstant: 150) ,
            self.avatarView.heightAnchor.constraint(equalToConstant: 150),
            
            self.stackNameWithStatus.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            self.stackNameWithStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.stackNameWithStatus.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15),
            self.stackNameWithStatus.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -20),
            
            self.setStatus.topAnchor.constraint(equalTo: stackNameWithStatus.bottomAnchor),
            self.setStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.setStatus.leadingAnchor.constraint(equalTo: self.stackNameWithStatus.leadingAnchor),
            self.setStatus.heightAnchor.constraint(equalToConstant: 40),
            
            self.buttonStatus.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 30),
            self.buttonStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.buttonStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.buttonStatus.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


