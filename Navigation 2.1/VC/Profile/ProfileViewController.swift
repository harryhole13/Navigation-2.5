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

    private var postsArray: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        self.postsArray = dataBase
//        self.tableView.reloadData()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        tableView.layoutIfNeeded()
//        PostTableViewCell().layoutIfNeeded()
//        CollectionView().layoutIfNeeded()
//    }
    
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

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionFeed", for: indexPath) as? CollectionView else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom Cell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
            let post = self.postsArray[indexPath.row]
            cell.setup(with: post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: "0 Section")
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return UITableView.automaticDimension
        }
        return 0.0
       
    }
    


    
}
