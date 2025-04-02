//
//  ChaptersView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/28/25.
//

import UIKit

import Then
import SnapKit

class ChaptersView: BaseView {
    
    // MARK: - UI Components
    
    private let chapterLabel = UILabel()
    private let chapterStackView = UIStackView()
    
    override func setStyles() {
        chapterLabel.do {
            $0.text = "Chapters"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 18)
        }
        
        chapterStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .leading
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(chapterLabel, chapterStackView)
        
        chapterLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        chapterStackView.snp.makeConstraints {
            $0.top.equalTo(chapterLabel.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    func configure(_ data: BookModel) {
        chapterStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for i in 0..<data.chapters.count {
            let label = UILabel()
            label.text = "\(data.chapters[i].title)"
            label.font = .systemFont(ofSize: 14)
            label.textColor = UIColor(hex: "#555555") // UIColor.darkGray 색상과 일치하는 hex code 입니다.
            label.clipsToBounds = true
            
            chapterStackView.addArrangedSubview(label)
        }
    }
}
