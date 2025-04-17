//
//  ExchangeRateViewController.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class ExchangeRateViewController: BaseViewController {
    
    private let viewModel = AppDependencyFactory.makeExchangeRateViewModel()
    private let disposeBag = DisposeBag()

    // MARK: - UI Components

    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let emptyLabel = UILabel()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func bindViewModel() {
        viewModel.action?(.fetch)

        searchBar.rx.text.orEmpty
            .skip(1)
            .bind(onNext: { [weak viewModel] query in
                viewModel?.action?(.search(query))
            })
            .disposed(by: disposeBag)

        viewModel.state.filteredItems
            .bind(to: tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                cell.configure(displayItem: item)
            }
            .disposed(by: disposeBag)

        viewModel.state.filteredItems
            .map { !$0.isEmpty }
            .observe(on: MainScheduler.instance)
            .bind(to: emptyLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ExchangeRateItemDisplay.self)
            .subscribe(onNext: { item in
                print("선택한 셀: 통화코드 - \(item.code), 국가 - \(item.country), 환율 - \(item.rate)")
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Set UIComponents
    
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
    
    // MARK: - Layout Helper

    
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

