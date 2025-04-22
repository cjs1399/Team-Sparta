//
//  ExchangeCalculatorView.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

final class ExchangeCalculatorView: BaseView {

    // MARK: - UI Components
    
    private(set) var labelStackView = UIStackView()
    private(set) var currencyLabel = UILabel()
    private(set) var countryLabel = UILabel()
    private(set) var amountTextField = UITextField()
    private(set) var convertButton = UIButton()
    private(set) var resultLabel = UILabel()

    // MARK: - Set UIComponents

    override func setStyles() {
        backgroundColor = UIColor(named: "CustomBackgroundColor")
        
        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }
        
        currencyLabel.do {
            $0.textColor = UIColor(named: "CustomTextColor")
            $0.font = .systemFont(ofSize: 24, weight: .bold)
        }
        
        countryLabel.do {
            $0.textColor = UIColor(named: "CustomSecondaryTextColor")
            $0.font = .systemFont(ofSize: 16)
        }
        
        amountTextField.do {
            $0.layer.borderWidth = 0.5
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor(named: "CustomSecondaryTextColor")?.cgColor
            $0.keyboardType = .decimalPad
            $0.textAlignment = .center
            $0.placeholder = "달러(USD)를 입력하세요"
        }
        
        convertButton.do {
            $0.setTitle("환율 계산", for: .normal)
            $0.titleLabel?.textColor = UIColor(named: "CustomTextColor")
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 8
        }
        
        resultLabel.do {
            $0.textColor = UIColor(named: "CustomTextColor")
            $0.font = .systemFont(ofSize: 20, weight: .medium)
            $0.textAlignment = .center
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(labelStackView, amountTextField, convertButton, resultLabel)
        labelStackView.addArrangedSubviews(currencyLabel, countryLabel)
        
        labelStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        amountTextField.snp.makeConstraints {
            $0.top.equalTo(labelStackView.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
        
        convertButton.snp.makeConstraints {
            $0.top.equalTo(amountTextField.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(44)
        }
            
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(convertButton.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
