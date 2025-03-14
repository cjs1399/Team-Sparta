//
//  DrawUpCardView.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import Then
import SnapKit

enum ViewType {
    case drawup
    case card
}

class DrawUpCardView: BaseView {
    
    // MARK: - UI Components
    
    private let backgroundImageView = UIImageView()
    private let titleLable = UILabel()
    private let subTitleLable = UILabel()
    
    private let viewType: ViewType
    
    init(viewType: ViewType) {
        self.viewType = viewType
        super.init(frame: .zero)
    }
    
    override func setStyles() {
        switch viewType {
        case .drawup:
            titleLable.do {
                $0.text = "오늘 내가 공부할 내용은?"
                $0.font = .fontGuide(.titleLabel)
                $0.textColor = UIColor(hex: "#000000")
            }
        case .card:
            titleLable.do {
                $0.text = "오늘 나는 이걸 공부할거야!"
                $0.font = .fontGuide(.titleLabel)
                $0.textColor = UIColor(hex: "#000000")
            }
            
            backgroundImageView.do {
                $0.layer.cornerRadius = 8
            }
        }
        backgroundImageView.do {
            $0.image = ImageLiterals.card_backgound_image
        }
        
        subTitleLable.do {
            $0.font = .fontGuide(.subTitleLabel)
            $0.textColor = UIColor(hex: "#000000")
            $0.numberOfLines = 3
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(backgroundImageView)
        backgroundImageView.addSubviews(titleLable, subTitleLable)
        
        titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170)
            $0.leading.equalToSuperview().offset(15)
        }
        
        subTitleLable.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func getTitleLabelText() -> UILabel {
        return titleLable
    }

    func getSubLabelText() -> UILabel {
        return subTitleLable
    }
    
    func getBackgroundImage() -> UIImage {
        return backgroundImageView.image ?? UIImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
