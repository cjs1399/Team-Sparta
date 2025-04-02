//
//  BookInformationStackView.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/28/25.
//

import UIKit

import Then
import SnapKit

class BookInformationStackView: BaseView {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let authorContentLabel = UILabel()
    private let releasedLabel = UILabel()
    private let releasedContentLabel = UILabel()
    private let pageLabel = UILabel()
    private let pageContentLabel = UILabel()
    
    private let mainContainer = UIStackView()
    private let contentContainer = UIStackView()
    private let authorContentStackView = UIStackView()
    private let releasedContentStackView = UIStackView()
    private let pageContentStackView = UIStackView()
    

    
    override func setStyles() {
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = ImageLiterals.harrypotter_poster_one
        }
        
        titleLabel.do {
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 20)
            $0.numberOfLines = 2
        }
        
        authorLabel.do {
            $0.text = "Author"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 16)
        }
        
        authorContentLabel.do {
            $0.textColor = UIColor(hex: "#555555") // UIColor.darkGray 색상과 일치하는 hex code 입니다.
            $0.font = .systemFont(ofSize: 18)
        }
        
        releasedLabel.do {
            $0.text = "Released"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 14)
        }
        
        releasedContentLabel.do {
            $0.textColor = UIColor(hex: "#808080") // UIColor.gray 색상과 일치하는 hex code 입니다.
            $0.font = .systemFont(ofSize: 14)
        }
        
        pageLabel.do {
            $0.text = "Pages"
            $0.textColor = UIColor(hex: "#000000")
            $0.font = .boldSystemFont(ofSize: 14)
        }
        
        pageContentLabel.do {
            $0.textColor = UIColor(hex: "#808080") // UIColor.gray 색상과 일치하는 hex code 입니다.
            $0.font = .systemFont(ofSize: 14)
        }
        
        mainContainer.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .top
        }
        
        contentContainer.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .leading
        }
        
        authorContentStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .leading
        }
        
        releasedContentStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .leading
        }
        
        pageContentStackView.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.alignment = .leading
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(mainContainer)
        mainContainer.addArrangedSubviews(imageView, contentContainer)
        contentContainer.addArrangedSubviews(titleLabel, authorContentStackView, authorContentStackView,
                                             releasedContentStackView, pageContentStackView)
        authorContentStackView.addArrangedSubviews(authorLabel, authorContentLabel)
        releasedContentStackView.addArrangedSubviews(releasedLabel, releasedContentLabel)
        pageContentStackView.addArrangedSubviews(pageLabel, pageContentLabel)
        
        mainContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(imageView.snp.width).multipliedBy(1.5)
        }
    }
    
    // MARK: - Methods
    
    func configure(_ data: BookModel, index: Int) {
        titleLabel.text = data.title
        authorContentLabel.text = data.author
        
        if let date = data.releaseDate.toFormattedDateString() {
            releasedContentLabel.text = date
        }

        pageContentLabel.text = "\(data.pages)"

        if index < ImageLiterals.allPosters.count {
            imageView.image = ImageLiterals.allPosters[index]
        } else {
            imageView.image = nil
        }
    }
    
}
