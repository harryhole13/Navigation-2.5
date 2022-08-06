//
//  TryCustomCollectionViewCell.swift
//  Navigation 2.1
//
//  Created by Алексей Потемин on 30.07.2022.
//

import UIKit

class TryCustomCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .black
    }
    
}
