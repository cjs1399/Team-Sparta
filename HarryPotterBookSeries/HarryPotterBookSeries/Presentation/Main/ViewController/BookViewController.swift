//
//  BookViewController.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/26/25.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class BookViewController: BaseViewController {
    
    
    private let viewModel = BookViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let bookTitleView = TitleLabelView()
    private let bookTopStackView = BookIndexStackView()
    
    
    // MARK: - Properties
    
    private var bookData: [BookModel] = []
    
    override func bindViewModel() {
        viewModel.outputs.bookData
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                self?.bookData = data
                if let text = self?.bookData[0].title {
                    self?.bookTitleView.getTitleLabel().text = text
                }
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
    }
    
    override func setLayout() {
        view.addSubviews(bookTitleView, bookTopStackView)
        
        bookTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        bookTopStackView.snp.makeConstraints {
            $0.top.equalTo(bookTitleView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    
}



