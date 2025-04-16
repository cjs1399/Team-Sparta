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
    private let subTitleLabel = UILabel()
    private let priceLabel = UILabel()
    
    override func setStyles() {
        titleLabel.do {
            $0.textColor = .black
        }
        
        subTitleLabel.do {
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 12, weight: .regular)
        }
        
        priceLabel.do {
            $0.textColor = .black
        }
    }
    override func setLayout() {
        contentView.addSubviews(titleLabel, subTitleLabel, priceLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(10)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(10)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String, subTitle: String, price: Double) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        priceLabel.text = String(format: "%.4f", price)
    }
}
