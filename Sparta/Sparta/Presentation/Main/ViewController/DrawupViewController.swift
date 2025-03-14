//
//  DrawupViewController.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class DrawupViewController: BaseViewController {
    
    private let viewModel: SpartaViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let drawUpCardView = DrawUpCardView(viewType: .drawup)
    private let inputTextView = UITextView()
    private let saveButton = UIButton()
    
    // MARK: - Properties
    
    private let placeholderText = "오늘 내가 공부할 내용을 작성해주세요!"
    private let placeholderColor = UIColor(hex: "#8B8B8D")
    private let verticalInset = SizeLiterals.Screen.screenHeight * 20 / 812
    private let horizontalInset = SizeLiterals.Screen.screenWidth * 12 / 375
    private var inputText: String = ""
    
    init(viewModel: SpartaViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceholder()
        setupKeyboardEvent()
    }
    
    override func bindViewModel() {
        saveButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let inputText = drawUpCardView.getSubLabelText().text
                let image = drawUpCardView.getBackgroundImage()
                self.viewModel.inputs.didTapSaveButton(with: image, text: inputText ?? "")
            })
            .disposed(by: disposeBag)
        
        inputTextView.rx.text.orEmpty
            .bind { [weak self] text in
                self?.viewModel.inputs.setTextView(with: text)
            }
            .disposed(by: disposeBag)
        
        
        viewModel.outputs.dismissToDrawupViewController
            .filter { $0 }
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] _ in
                self?.dismiss(animated: true)
                self?.viewModel.inputs.didDismissDrawupViewController()
                self?.viewModel.inputs.didDismissDrawupViewControllerIsSaveButtonEnabled()
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isSaveButtonEnabled
            .subscribe(onNext: { [weak self] isEnabled in
                self?.setSaveButton(isEnabled)
            })
            .disposed(by: disposeBag)
    }
    
    override func setStyles() {
        view.backgroundColor = UIColor(hex: "#DCC2BA")
        
        inputTextView.do {
            $0.font = .fontGuide(.subTitleLabel)
            $0.textColor = UIColor(hex: "#000000")
            $0.layer.cornerRadius = 15
            $0.backgroundColor = UIColor(hex: "#FFFFFF")
            $0.textContainerInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
            $0.showsVerticalScrollIndicator = false
            $0.autocorrectionType = .no
        }
        
        saveButton.do {
            $0.setTitle("카드 만들기", for: .normal)
            $0.setTitleColor(UIColor(hex: "#000000"), for: .normal)
            $0.backgroundColor = UIColor(hex: "#74FADB")
            $0.layer.cornerRadius = 15
            $0.isEnabled = false
        }
    }
    
    override func setLayout() {
        view.addSubviews(drawUpCardView, inputTextView, saveButton)
        
        drawUpCardView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(SizeLiterals.Screen.screenHeight * 150 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenHeight * 300 / 812)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 257 / 812)

        }
        
        inputTextView.snp.makeConstraints {
            $0.top.equalTo(drawUpCardView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 20 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 343 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 141 / 812)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(inputTextView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 11 / 812)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 343 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 44 / 812)
        }
    }
    
    override func setDelegates() {
        inputTextView.delegate = self
    }

    
    private func setPlaceholder() {
        inputTextView.attributedText = NSAttributedString(
            string: placeholderText,
            attributes: [
                .foregroundColor: placeholderColor,
                .font: UIFont.fontGuide(.subTitleLabel)
            ]
        )
        drawUpCardView.getSubLabelText().text = ""
    }
    
    private func setSaveButton(_ isEnabled: Bool) {
        isEnabled && drawUpCardView.getSubLabelText().text != "" ? saveButton.setTitleColor(UIColor(hex: "#000000"), for: .normal) : saveButton.setTitleColor(UIColor(hex: "#FFFFFF"), for: .normal)
        saveButton.backgroundColor = isEnabled ? UIColor(hex: "#74FADB") : UIColor(hex: "#EDEDED")
        saveButton.isEnabled = isEnabled
    }
    
    private func removePlaceholder() {
        if inputTextView.attributedText.string == placeholderText {
            inputTextView.text = ""
            inputTextView.textColor = UIColor(hex: "#000000")
            inputTextView.font = .fontGuide(.subTitleLabel)
        }
    }
    
    func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentResponder as? UITextView else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame,
                                                  from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let textFieldTopY = convertedTextFieldFrame.origin.y
            let newFrame = textFieldTopY - keyboardTopY/1.6
            view.frame.origin.y -= newFrame
        }
    }
    
    @objc
    func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DrawupViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        removePlaceholder()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            setPlaceholder()
        } else {
            drawUpCardView.getSubLabelText().text = textView.text
        }
    }
}
