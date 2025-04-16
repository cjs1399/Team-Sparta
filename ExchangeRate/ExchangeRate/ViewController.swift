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
    
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        viewModel.inputs.fetchRates()

        viewModel.outputs.items
            .drive(tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                cell.configure(title: item.currencyCode, price: item.rate)
            }
            .disposed(by: disposeBag)

        viewModel.outputs.errorMessage
            .drive(onNext: { message in
                guard let msg = message else { return }
                print("⚠️ Error: \(msg)")
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = .white
        tableView.do {
            $0.register(ExchangeRateTableViewCell.self, forCellReuseIdentifier: "ExchangeRateTableViewCell")
            $0.separatorStyle = .none
            $0.rowHeight = 44
        }
    }
    
    override func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

