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
    private let bookIndexCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let bookInformationStackView = BookInformationStackView()
    private let dedicationStackView = DedicationStackView()
    private let summaryStackView = SummaryStackView()
    private let chaptersView = ChaptersView()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    
    // MARK: - Properties
    
    var itemCount = 0
    let itemWidth: CGFloat = 30
    let spacing: CGFloat = 10
    private var selectedIndex: Int = 0

    
    private var bookData: [BookModel] = []
    
    override func bindViewModel() {
        
        summaryStackView.getToggleMoreButton().rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.inputs.didTapMoreButton()
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isTapMoreButton
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isExpanded in
                self?.summaryStackView.setExpanded(isExpanded)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.bookData
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                self?.bookData = data
                self?.itemCount = data.count
                self?.bookIndexCollectionView.reloadData()
            })
            .disposed(by: disposeBag)

        
        viewModel.outputs.selectedBook
            .compactMap { $0 }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (book, index) in
                guard let self = self else { return }
                let isExpanded = self.viewModel.outputs.isTapMoreButton.value

                self.bookTitleView.getTitleLabel().text = book.title
                self.bookInformationStackView.configure(book, index: index)
                self.dedicationStackView.configure(book)
                self.summaryStackView.configure(book, index: index, isExpanded: isExpanded)
                self.chaptersView.configure(book)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.errorMessage
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] message in
                self?.showAlert(message: message)
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        
        bookIndexCollectionView.do {
            let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
             layout.scrollDirection = .horizontal
             layout.minimumInteritemSpacing = 10
             layout.itemSize = CGSize(width: 30, height: 30)

             $0.register(BookIndexCell.self, forCellWithReuseIdentifier: BookIndexCell.id)
             $0.showsHorizontalScrollIndicator = false
             $0.backgroundColor = .clear
             $0.dataSource = self
             $0.delegate = self
        }
        
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 24
            $0.alignment = .fill
            $0.distribution = .fill
            $0.isLayoutMarginsRelativeArrangement = true
        }
    }
    
    override func setLayout() {        
        view.addSubviews(bookTitleView, bookIndexCollectionView, scrollView)
        scrollView.addSubviews(stackView)
        stackView.addArrangedSubviews(bookInformationStackView, dedicationStackView, summaryStackView, chaptersView)
        
        bookTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        bookIndexCollectionView.snp.remakeConstraints {
            $0.top.equalTo(bookTitleView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(CGFloat(itemCount) * itemWidth + CGFloat(itemCount - 1) * spacing)
            $0.height.equalTo(40)
        }
    
        scrollView.snp.makeConstraints {
            $0.top.equalTo(bookIndexCollectionView.snp.bottom).offset(10)
            $0.directionalHorizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}



extension BookViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookIndexCell.id, for: indexPath) as? BookIndexCell else {
            return UICollectionViewCell()
        }
        let isSelected = indexPath.item == selectedIndex
        cell.configure(index: indexPath.item, isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        viewModel.inputs.didTapIndexButton(indexPath.item)
    }
}
