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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func bindViewModel() {
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.inputs.searchText)
            .disposed(by: disposeBag)
        
        viewModel.outputs.filteredItems
            .drive(tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                let country = CurrencyCountryMapper.shared.countryName(for: item.currencyCode)
                cell.configure(title: item.currencyCode, subTitle: country, price: item.rate)
            }
            .disposed(by: disposeBag)
        
        viewModel.inputs.fetchRates()
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
    }
    
    override func setLayout() {
        view.addSubviews(searchBar, tableView)

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

