//
//  DedicationStackView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/28/25.
//

import UIKit

import Then
import SnapKit

class DedicationStackView: BaseView {
    
    // MARK: - UI Components
    
    private let dedicationLabel = UILabel()
    private let dedicationTextView = UITextView()
    private let dedicationStackView = UIStackView()

    
    override func setStyles() {
        dedicationLabel.do {
            $0.text = "Dedication"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 18)
        }
        
        dedicationTextView.do {
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = UIColor(hex: "#555555") // UIColor.darkGray 색상과 일치하는 hex code 입니다.
            $0.isScrollEnabled = false
            $0.textContainerInset = .zero
            $0.textContainer.lineFragmentPadding = 0
            $0.isEditable = false
        }
        
        dedicationStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .leading
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(dedicationStackView)
        dedicationStackView.addArrangedSubviews(dedicationLabel, dedicationTextView)

        
        dedicationStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        dedicationTextView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func configure(_ data: BookModel) {
        dedicationTextView.text = data.dedication
    }
}
