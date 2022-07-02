//
//  PostViewController.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 18.06.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    private var titlePost: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Post"
        title.backgroundColor = .white
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(titlePost)
        
        NSLayoutConstraint.activate([
            self.titlePost.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titlePost.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.titlePost.widthAnchor.constraint(equalToConstant: 80),
            self.titlePost.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        
    }

}
