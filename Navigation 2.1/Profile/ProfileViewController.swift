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
    
    private lazy var newButton: UIButton = {
        let button = UIButton()
        //button.clipsToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New button", for: .normal)
        //button.titleLabel?.textColor = UIColor.black  // why not working ((((
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.backgroundColor = UIColor.black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileView)
        self.view.addSubview(newButton)
        view.backgroundColor = .white
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        navigationController?.navigationBar.isTranslucent = true
        
        NSLayoutConstraint.activate([
            self.profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileView.heightAnchor.constraint(equalToConstant: 220),
            
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.newButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}

