//
//  SummaryStackView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/28/25.
//

import UIKit

import Then
import SnapKit

class SummaryStackView: UIStackView {
    
    // MARK: - UI Components
    
    private let summaryLabel = UILabel()
    private let summaryTextLabel = UILabel()
    private let moreButtonStackView = UIStackView()
    private let spacerView = UIView()
    private let toggleMoreButton = UIButton()
    
    private var isExpanded: Bool = false
    private var fullText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyles()
        setLayout()
    }
    
    func setStyles() {
        axis = .vertical
        spacing = 8
        alignment = .leading
        
        summaryLabel.do {
            $0.text = "Summary"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 18)
        }
        
        summaryTextLabel.do {
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = UIColor(hex: "#555555")
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }
        
        moreButtonStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
        }
        
        toggleMoreButton.do {
            $0.setTitle("더 보기", for: .normal)
            $0.setTitleColor(UIColor(hex: "#007AFF"), for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14)
            $0.isHidden = false
            $0.setContentHuggingPriority(.required, for: .horizontal)
        }
    }
    
    // MARK: - Layout Helper
    
    func setLayout() {
        addArrangedSubviews(summaryLabel, summaryTextLabel, moreButtonStackView)
        moreButtonStackView.addArrangedSubviews(spacerView, toggleMoreButton)
    
        summaryTextLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }

        spacerView.snp.makeConstraints {
            $0.height.equalTo(0)
        }
        
        moreButtonStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func getToggleMoreButton() -> UIButton {
        return toggleMoreButton
    }
    
    func setExpanded(_ expanded: Bool) {
        isExpanded = expanded
        updateTextLabel()
    }
    

    func configure(_ data: BookModel, index: Int, isExpanded: Bool) {
        fullText = data.summary
        self.isExpanded = isExpanded
        updateTextLabel()

        if data.summary.count < 450 {
            toggleMoreButton.isHidden = true
        } else {
            toggleMoreButton.isHidden = false
            toggleMoreButton.setTitle(isExpanded ? "접기" : "더 보기", for: .normal)
        }
    }
    
    
    private func updateTextLabel(maxCharacters: Int = 450) {
        if isExpanded {
            summaryTextLabel.text = fullText
            toggleMoreButton.setTitle("접기", for: .normal)
            summaryTextLabel.numberOfLines = 0
        } else {
            if fullText.count > maxCharacters {
                let truncated = String(fullText.prefix(maxCharacters)) + "..."
                summaryTextLabel.text = truncated
            } else {
                summaryTextLabel.text = fullText
            }
            toggleMoreButton.setTitle("더 보기", for: .normal)
            summaryTextLabel.numberOfLines = 0
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
