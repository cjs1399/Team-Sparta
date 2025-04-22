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
        /// View의 사용자 입력(Action)을 ViewModel에 '전달'하고 ViewModel은 그에 대한 상태를 '반응'하여 UI를 출력한다는 흐름
        viewModel.actionRelay.accept(.fetch)
    

        // 검색어 입력 -> 검색 액션 전달
        contentView.searchBar.rx.text.orEmpty
            .skip(1)
            .bind(onNext: { [weak viewModel] query in
                viewModel?.actionRelay.accept(.search(query))
            })
            .disposed(by: disposeBag)

        // 결과 -> 테이블뷰 출력
        viewModel.state.filteredItems
            .bind(to: contentView.tableView.rx.items(
                cellIdentifier: "ExchangeRateTableViewCell",
                cellType: ExchangeRateTableViewCell.self
            )) { [weak self] _, item, cell in
                guard let self else { return }

                // 데이터 세팅
                cell.configure(displayItem: item)

                // 버튼 탭 시 CoreData 업데이트 + 리스트 갱신
                cell.getFavoriteButton().rx.tap
                    .subscribe(onNext: {
                        let newState = !item.isFavorite
                        self.viewModel.actionRelay.accept(.toggleFavorite(code: item.code, isFavorite: newState))

                        // 현재 검색어 기준으로 다시 정렬 요청
                        let currentQuery = self.contentView.searchBar.text ?? ""
                        self.viewModel.actionRelay.accept(.search(currentQuery))
                    })
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)

        // 결과가 없을 경우 emptyLabel 노출
        viewModel.state.filteredItems
            .map { !$0.isEmpty }
            .observe(on: MainScheduler.instance)
            .bind(to: contentView.emptyLabel.rx.isHidden)
            .disposed(by: disposeBag)
        

        // 셀 선택 → 계산기 화면으로 이동 히히
        contentView.tableView.rx.modelSelected(ExchangeRateItemDisplay.self)
            .subscribe(onNext: { [weak self] item in
                /// 해당 구조는 AppDependencyFactory가 모든 의존성을 생성하고 ExchangeReateVC가 외부 이벤트(Cell 선택)에 따라 ViewModel이 생성되는 것.
                /// AppDependencyFactory는 전체 앱에서 사용되는 의존성의 생성 책임을 갖는 팩토리입니다.
                /// 각 ViewController는 자신이 사용할 ViewModel이나 UseCase 등을 직접 생성하지 않고, Factory에게 생성 책임을 위임하여 SRP를 지키고, 테스트 및 유지보수성을 높이는 구조
                let calculatorVC = ExchangeCalculatorViewController(viewModel: AppDependencyFactory.makeExchangeCalculatorViewModel(item: item))
                self?.navigationController?.pushViewController(calculatorVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        title = "환율 정보"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

