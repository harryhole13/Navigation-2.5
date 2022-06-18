//
//  ProfileViewController.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 12.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var profileView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        //profileView.backgroundColor = .black
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    private lazy var stackButton:UIStackView = {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var showPostButton1: UIButton = {
        let button = UIButton()
        //button.clipsToBounds = false
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post Button 1", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(showPostModal), for: .touchUpInside)
        

        return button
    }()
    
    private lazy var showPostButton2: UIButton = {
        let button = UIButton()
        //button.clipsToBounds = false
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post Button 2", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(showPostModal), for: .touchUpInside)

        return button
    }()
    
    @objc private func showPostModal() {
        //self.navigationController?.pushViewController(PostViewController(), animated: true)
        present(PostViewController(), animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileView)
        self.view.addSubview(stackButton)
        self.stackButton.addArrangedSubview(showPostButton1)
        self.stackButton.addArrangedSubview(showPostButton2)
        
        view.backgroundColor = .white
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        navigationController?.navigationBar.isTranslucent = true
        
        NSLayoutConstraint.activate([
            self.profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileView.heightAnchor.constraint(equalToConstant: 220),
            
            self.stackButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackButton.heightAnchor.constraint(equalToConstant: 100),
            self.stackButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}

