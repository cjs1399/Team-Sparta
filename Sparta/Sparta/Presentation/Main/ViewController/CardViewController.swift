//
//  CardViewController.swift
//  sparta
//
//  Created by 천성우 on 3/7/25.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class CardViewController: BaseViewController {
    
    private let viewModel: SpartaViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let cardView = DrawUpCardView(viewType: .card)
    
    init(viewModel: SpartaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        viewModel.outputs.cardSubTitleText
            .compactMap { $0 }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] title in
                self?.cardView.getSubLabelText().text = title
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.careCreatedAt
            .observe(on: MainScheduler.instance)
            .map { date -> String in
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "M월dd일"
                return dateFormatter.string(from: date)
            }.subscribe(onNext: { [weak self] formattedDate in
                self?.cardView.getTitleLabelText().text = "\(formattedDate)의 나는 이것들을 공부했어"
            })
            .disposed(by: disposeBag)
        
    }
    
    override func setStyles() {
        view.backgroundColor = UIColor(hex: "#DCC2BA")
        navigationController?.navigationBar.tintColor = UIColor(hex: "#000000")
    }
    
    override func setLayout() {
        view.addSubviews(cardView)
        
        cardView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenHeight * 300 / 812)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 257 / 812)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

