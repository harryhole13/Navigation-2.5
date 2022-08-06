//
//  PhotosTableViewCell.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 23.07.2022.
//

import UIKit

class PhotosTableViewCell: UICollectionViewCell {
    
    private lazy var photoView:UIImageView = {
        
        let image = UIImageView(image: UIImage())
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photoView)
        
        NSLayoutConstraint.activate([
            self.photoView.topAnchor.constraint(equalTo: self.topAnchor),
            self.photoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.photoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func setup(with photo: ModelCollection) {
        self.photoView.image = UIImage(named: photo.image)
        }
}
