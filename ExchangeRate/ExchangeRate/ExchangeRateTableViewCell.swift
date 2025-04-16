//
//  ExchangeRateTableViewCell.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class ExchangeRateTableViewCell: BaseTableViewCell {
    
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    
    override func setStyles() {
        titleLabel.do {
            $0.textColor = .black
        }
        
        priceLabel.do {
            $0.textColor = .black
        }
    }
    override func setLayout() {
        contentView.addSubviews(titleLabel, priceLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String, price: Double) {
        titleLabel.text = title
        priceLabel.text = "\(price)"
    }
}
