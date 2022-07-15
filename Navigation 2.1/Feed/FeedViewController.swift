//
//  FeedViewController.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 03.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
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
        button.setTitle("Post Button 1", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(showPostModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var showPostButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Post Button 2", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(showPostModal), for: .touchUpInside)
        return button
    }()
    
    @objc private func showPostModal() {
        present(PostViewController(), animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(stackButton)
        self.stackButton.addArrangedSubview(showPostButton1)
        self.stackButton.addArrangedSubview(showPostButton2)
        
        NSLayoutConstraint.activate([
            self.stackButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.stackButton.heightAnchor.constraint(equalToConstant: 100),
            self.stackButton.widthAnchor.constraint(equalToConstant: 200),
        ])

    }

}
