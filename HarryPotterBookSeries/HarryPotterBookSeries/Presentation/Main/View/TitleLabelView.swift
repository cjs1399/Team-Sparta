//
//  TitleLabelView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/27/25.
//

import UIKit

import Then
import SnapKit

class TitleLabelView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    
    override func setStyles() {
        titleLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 24)
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Methods
    
    func getTitleLabel() -> UILabel {
        return titleLabel
    }
}
