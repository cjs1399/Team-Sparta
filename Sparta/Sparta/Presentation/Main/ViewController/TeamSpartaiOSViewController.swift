//
//  TeamSpartaiOSViewController.swift
//  sparta
//
//  Created by 천성우 on 3/4/25.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa
import CoreData

final class TeamSpartaiOSViewController: BaseViewController {
    
    private let viewModel = SpartaViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    private let backgroundImageView = BackgroundImageView()
    private let plusButton = PlusButtonView()
    private let drawupCollectionView = DrawupCollectionView()

    // MARK: - Properties
    
    private var drawupDataList: [DrawupData] = []
    
    override func bindViewModel() {
        plusButton.getPlusButton().rx.tap
            .subscribe(onNext: { [weak self] in
                self?.viewModel.inputs.didTapPlustButton()
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.presentToDrawupViewController
            .filter { $0 }
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                self?.presentToDrawupViewController()
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.drawupDataList
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] data in
                self?.drawupDataList = data
                self?.drawupCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    override func setLayout() {
        view.addSubviews(backgroundImageView)
        backgroundImageView.addSubviews(plusButton, drawupCollectionView)
        
        plusButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-57)
        }
        
        drawupCollectionView.snp.makeConstraints {
            $0.leading.equalTo(plusButton.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-57)
            $0.height.equalTo(SizeLiterals.Screen.screenWidth * 100 / 375)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight)
        }
    }
    
    private func presentToDrawupViewController() {
        let presentVC = DrawupViewController(viewModel: self.viewModel)
        present(presentVC, animated: true, completion: nil)
    }
    
    private func pushToCardViewController() {
        let pushVC = CardViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    override func setDelegates() {
        drawupCollectionView.dataSource = self
        drawupCollectionView.delegate = self
    }
}

extension TeamSpartaiOSViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drawupDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrawupCollectionViewCell.identifier, for: indexPath) as! DrawupCollectionViewCell
        cell.configure(with: drawupDataList[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = drawupDataList[indexPath.item]
        viewModel.inputs.didTapCollectionViewCell(with: selectedData.text ?? "내용 없음", date: selectedData.createdAt ?? Date())
        pushToCardViewController()
    }
}
