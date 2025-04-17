//
//  ExchangeRateView.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

final class ExchangeRateView: BaseView {
    
    // MARK: - UI Components
    
    private(set) var searchBar = UISearchBar()
    private(set) var tableView = UITableView()
    private(set) var emptyLabel = UILabel()

    
    // MARK: - Set UIComponents

    override func setStyles() {
        backgroundColor = .white

        searchBar.do {
            $0.placeholder = "통화 검색"
        }
        
        tableView.do {
            $0.register(ExchangeRateTableViewCell.self, forCellReuseIdentifier: "ExchangeRateTableViewCell")
            $0.separatorStyle = .none
            $0.rowHeight = 60
        }
        
        emptyLabel.do {
            $0.text = "검색 결과 없음"
            $0.textAlignment = .center
            $0.textColor = .gray
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.isHidden = true
        }
    }
    
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(searchBar, tableView, emptyLabel)
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }

        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    
    // MARK: - Methods

}
