//
//  BackgroundImageView.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import Then
import SnapKit

class BackgroundImageView: BaseView {
    
    // MARK: - UI Components
    
    private let backgroundImageView = UIImageView()
    
    
    override func setStyles() {
        backgroundImageView.do {
            $0.image = ImageLiterals.view_backgound_image
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
}
