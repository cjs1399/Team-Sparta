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

final class ExchangeRateViewController: BaseViewController {

    // MARK: - Properties

    private let viewModel: ExchangeRateViewModel
    private let disposeBag = DisposeBag()

    // MARK: - UI Components

    private let contentView = ExchangeRateView()

    // MARK: - Init (DI)

    init(viewModel: ExchangeRateViewModel = AppDependencyFactory.makeExchangeRateViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    override func loadView() {
        view = contentView
    }

    override func bindViewModel() {
        viewModel.action?(.fetch)

        // 검색어 입력 -> 검색 액션 전달
        contentView.searchBar.rx.text.orEmpty
            .skip(1)
            .bind(onNext: { [weak viewModel] query in
                viewModel?.action?(.search(query))
            })
            .disposed(by: disposeBag)

        // 결과 -> 테이블뷰 출력
        viewModel.state.filteredItems
            .bind(to: contentView.tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { _, item, cell in
                cell.configure(displayItem: item)
            }
            .disposed(by: disposeBag)

        // 결과가 없을 경우 emptyLabel 노출
        viewModel.state.filteredItems
            .map { !$0.isEmpty }
            .observe(on: MainScheduler.instance)
            .bind(to: contentView.emptyLabel.rx.isHidden)
            .disposed(by: disposeBag)

        // 셀 선택 → 계산기 화면으로 이동
        contentView.tableView.rx.modelSelected(ExchangeRateItemDisplay.self)
            .subscribe(onNext: { [weak self] item in
                let calculatorViewModel = ExchangeCalculatorViewModel(selectedItem: item)
                let calculatorVC = ExchangeCalculatorViewController(viewModel: calculatorViewModel)
                self?.navigationController?.pushViewController(calculatorVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

