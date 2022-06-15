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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        self.view.addSubview(profileView)
        //self.navigationController?.navigationBar.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            self.profileView.topAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor)
                ,
            self.profileView.leadingAnchor.constraint(
                equalTo: self.view.leadingAnchor),
            self.profileView.trailingAnchor.constraint(
                equalTo: self.view.trailingAnchor),
            self.profileView.bottomAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

