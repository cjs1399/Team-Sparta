//
//  ViewController.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class ViewController: BaseViewController {
    
    private let viewModel = ExchangeRateViewModel()
    private let disposeBag = DisposeBag()
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let emptyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func bindViewModel() {
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.inputs.searchText)
            .disposed(by: disposeBag)
        
        viewModel.outputs.filteredItems
            .drive(onNext: { [weak self] items in
                self?.emptyLabel.isHidden = !items.isEmpty
            })
            .disposed(by: disposeBag)

        viewModel.outputs.filteredItems
            .drive(tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                cell.configure(displayItem: item)
            }
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .white
        
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
    
    override func setLayout() {
        view.addSubviews(searchBar, tableView, emptyLabel)

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        emptyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}

