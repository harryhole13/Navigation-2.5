//
//  ProfileViewController.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 12.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "0 Section")
        tableView.register(CollectionView.self, forCellReuseIdentifier: "CollectionFeed")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"Default Cell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Custom Cell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        return tableView
    }()

    private lazy var postsArray: [Post] = []
    
    private lazy var ava = ProfileHeaderView()
    
    private lazy var theCross: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .red
        button.layer.opacity = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private var fullScreenView: UIView = {
        let fullScreen = UIView()
        fullScreen.backgroundColor = .black
        fullScreen.translatesAutoresizingMaskIntoConstraints = false
        return fullScreen
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.view.addSubview(fullScreenView)
        self.fullScreenView.addSubview(theCross)
        self.navigationController?.isNavigationBarHidden = false
      
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.theCross.topAnchor.constraint(equalTo: self.fullScreenView.topAnchor, constant: 30),
            self.theCross.heightAnchor.constraint(equalToConstant: 30),
            self.theCross.trailingAnchor.constraint(equalTo: self.fullScreenView.trailingAnchor, constant: 30),
            self.theCross.widthAnchor.constraint(equalToConstant: 30),
        ])
        self.postsArray = dataBase
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return 1
        } else {
            return postsArray.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionFeed", for: indexPath) as? CollectionView else { return UITableViewCell() }
            cell.imageArrowButton.tag = indexPath.row
            cell.imageArrowButton .addTarget(self, action: #selector(showCollection), for: .touchUpInside)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
            let post = self.postsArray[indexPath.row]
            cell.setup(with: post)
            return cell
        }
        
    }
    
    @objc private func showCollection() {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "0 Section") as? ProfileHeaderView else { return UITableViewHeaderFooterView() }
            
            let tapGesture = UITapGestureRecognizer()
            tapGesture.addTarget(self, action: #selector(tapAction))
            header.avatarImageView.isUserInteractionEnabled = true
            header.avatarImageView.addGestureRecognizer(tapGesture)
        
            return header
        }
        return nil
    }
    
    @objc func tapAction() {
        print("click ava")
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveLinear,
                       animations: {
            
            self.fullScreenView.layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            self.fullScreenView.layer.opacity = 0
        },
                       completion: {_ in
            self.ava.zoomAva()
        }
                       )
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }
        return 0.0
    }
}
