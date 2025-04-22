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
    private let rightStackView = UIStackView()
    private let rateLabel = UILabel()
    private let favoritesButton = UIButton()
    private let directionLabel = UILabel()
    
    override func setStyles() {
        backgroundColor = UIColor(named: "CustomBackgroundColor")
        selectionStyle = .none
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
        }
        
        currencyLabel.do {
            $0.textColor = UIColor(named: "CustomTextColor")
            $0.font = .systemFont(ofSize: 16)
        }
        
        countryLabel.do {
            $0.textColor = UIColor(named: "CustomSecondaryTextColor")
            $0.font = .systemFont(ofSize: 14)
        }
        
        rightStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        rateLabel.do {
            $0.textColor = UIColor(named: "CustomTextColor")
            $0.textAlignment = .right
            $0.font = .systemFont(ofSize: 16)
        }
        
        favoritesButton.do {
            $0.setImage(UIImage(systemName: "star"), for: .normal)
            $0.tintColor = .systemYellow
            // UIColor(named: "CustomFavoriteColor")
        }
        
        directionLabel.do {
            $0.font = .systemFont(ofSize: 14)
            $0.textAlignment = .center
        }
    }
    override func setLayout() {
        contentView.addSubviews(labelStackView, rightStackView)
        labelStackView.addArrangedSubviews(currencyLabel, countryLabel)
        rightStackView.addArrangedSubviews(rateLabel, directionLabel, favoritesButton)
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
        
        rateLabel.snp.makeConstraints {
            $0.width.equalTo(120)
        }
        
        directionLabel.snp.makeConstraints {
            $0.width.equalTo(20)
        }
        
        favoritesButton.snp.makeConstraints {
            $0.height.width.equalTo(44)
        }
    }

    func configure(displayItem: ExchangeRateItemDisplay) {
        currencyLabel.text = displayItem.code
        countryLabel.text = displayItem.country
        rateLabel.text = String(format: "%.4f", displayItem.rate)

        let imageName = displayItem.isFavorite ? "star.fill" : "star"
        favoritesButton.setImage(UIImage(systemName: imageName), for: .normal)

        switch displayItem.direction {
        case .up:
            directionLabel.text = "🔼"
        case .down:
            directionLabel.text = "🔽"
        case .none:
            directionLabel.text = ""
        }
    }
    
    func getFavoriteButton() -> UIButton {
        return favoritesButton
    }
}
