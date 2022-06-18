//
//  PostViewController.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 18.06.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    private var titlePost: UILabel {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Post"
        title.backgroundColor = .white
        title.textColor = .black
        return title
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.addSubview(titlePost)
        
        
    }

}
