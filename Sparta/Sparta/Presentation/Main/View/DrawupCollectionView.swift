//
//  DrawupCollectionView.swift
//  sparta
//
//  Created by 천성우 on 3/7/25.
//

import UIKit

import SnapKit
import Then

final class DrawupCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = SizeLiterals.Screen.screenWidth * 15 / 375
            $0.minimumInteritemSpacing = 0
            $0.itemSize = CGSize(width: SizeLiterals.Screen.screenHeight * 100 / 812, height: SizeLiterals.Screen.screenHeight * 100 / 812)
        }
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = .clear
        self.register(DrawupCollectionViewCell.self, forCellWithReuseIdentifier: DrawupCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
