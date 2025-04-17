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
    
    private let labelStackView = UIStackView()
    private let currencyLabel = UILabel()
    private let countryLabel = UILabel()
    private let rateLabel = UILabel()
    
    override func setStyles() {
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
        }
        
        currencyLabel.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
        
        countryLabel.do {
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 14)
        }
        
        rateLabel.do {
            $0.textColor = .black
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 16)
        }
    }
    override func setLayout() {
        contentView.addSubviews(labelStackView, rateLabel)
        labelStackView.addArrangedSubviews(currencyLabel, countryLabel)
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        rateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(120)
        }
    }
    
    func configure(displayItem: ExchangeRateItemDisplay) {
        currencyLabel.text = displayItem.code
        countryLabel.text = displayItem.country
        rateLabel.text = String(format: "%.4f", displayItem.rate)

        countryLabel.isHidden = false
        rateLabel.isHidden = false
    }
}
