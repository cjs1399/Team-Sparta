//
//  DrawupCollectionViewCell.swift
//  sparta
//
//  Created by 천성우 on 3/7/25.
//

import UIKit

import Then
import SnapKit

class DrawupCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DrawupCollectionViewCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyles()
        setLayout()
    }
    
    private func setStyles() {
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(imageView)
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(SizeLiterals.Screen.screenHeight * 100 / 812)
            $0.edges.equalToSuperview()
        }
    }

    func configure(with data: DrawupData) {
        if let imageData = data.imageData {
            imageView.image = UIImage(data: imageData)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
