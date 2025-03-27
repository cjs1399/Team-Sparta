//
//  BookIndexStackView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/27/25.
//

import UIKit

import Then
import SnapKit

class BookIndexStackView: BaseView {
    
    // MARK: - UI Components
    
//    private let stackView = UIStackView()
    private let indexButton = UIButton()
    
    override func setStyles() {
//        stackView.do {
//            $0.axis = .horizontal
//            $0.spacing = 10
//            $0.alignment = .center
//            $0.distribution = .equalCentering
//        }
        
        indexButton.do {
            $0.setTitle("1", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16)
            $0.layer.cornerRadius = 23
            $0.backgroundColor = UIColor(hex: "#007AFF")
            // 아이폰 system blue와 같은 색입니다.
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(indexButton)
        
        indexButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.center.equalToSuperview()
            $0.height.width.equalTo(45)
        }
        

    }
    
    // MARK: - Methods
}
