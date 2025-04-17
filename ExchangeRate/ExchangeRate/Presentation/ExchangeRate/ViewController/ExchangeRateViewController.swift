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
    
    private let contentView = ExchangeRateView()
    
    // MARK: - View Life Cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func bindViewModel() {
        viewModel.action?(.fetch)
        
        contentView.searchBar.rx.text.orEmpty
            .skip(1)
            .bind(onNext: { [weak viewModel] query in
                viewModel?.action?(.search(query))
            })
            .disposed(by: disposeBag)
        
        viewModel.state.filteredItems
            .bind(to: contentView.tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                cell.configure(displayItem: item)
            }
            .disposed(by: disposeBag)
        
        viewModel.state.filteredItems
            .map { !$0.isEmpty }
            .observe(on: MainScheduler.instance)
            .bind(to: contentView.emptyLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        contentView.tableView.rx.modelSelected(ExchangeRateItemDisplay.self)
             .subscribe(onNext: { [weak self] item in
                 print("선택한 셀: \(item.code) - \(item.country)")
                 let calculatorVC = ExchangeCalculatorViewController()
                 self?.navigationController?.pushViewController(calculatorVC, animated: true)
             })
             .disposed(by: disposeBag)
    }
    
}

