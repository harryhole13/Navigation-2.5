//
//  CollectionView.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 24.07.2022.
//

import UIKit

class CollectionView: UITableViewCell {
    
    enum Constant {
        static let numberOfItems:CGFloat = 4
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        return layout
    }()

    private lazy var coollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: "Myfeed")
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
    
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(coollectionView)
                let screenSize01 = UIScreen.main.bounds
                let screenWidth01 = screenSize01.width
                let spacing = (coollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
                let insets = (coollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
                let neededWidth = screenWidth01 - (Constant.numberOfItems - 1) * spacing - insets.right - insets.left
                let itemWidth = floor(neededWidth / Constant.numberOfItems)
                let collectionNeededHeight = itemWidth + insets.bottom + insets.top

        NSLayoutConstraint.activate([
           
            self.coollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.coollectionView.heightAnchor.constraint(equalToConstant: collectionNeededHeight),
            self.coollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.coollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.coollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
        ])
        self.coollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Myfeed", for: indexPath) as? PhotosTableViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            return cell
        }
        let viewModel = collectionPhotos[indexPath.row]
        cell.setup(with: viewModel)
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let neededWidth = collectionView.frame.width - (Constant.numberOfItems - 1) * spacing - insets.right - insets.left
        let itemWidth = floor(neededWidth / Constant.numberOfItems)
    
        return CGSize(width: itemWidth, height: itemWidth)
        
        
    }
    
}
    
