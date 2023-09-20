//
//  RateView.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 16/09/2023.
//

import UIKit
import SnapKit

final class RateView: UIView {
    
    var onClose: (() -> Void)?
    
    private lazy var blurView = UIVisualEffectView()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша ставка:"
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var rateTextField: UITextField = {
        let rate = UITextField()
        rate.layer.cornerRadius = 20
        rate.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        rate.layer.borderWidth = 1
        rate.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        rate.keyboardType = .decimalPad
        rate.textAlignment = .center
        rate.font = UIFont(name: "Avenir Next Bold", size: 30)
        return rate
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 25)
        button.setTitle("Cохранить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        hideKeyboard()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showAnimated(on parentViewController: MainViewController) {
        blurView = UIVisualEffectView(frame: parentViewController.view.bounds)
        setupBlurEffect()
        
        parentViewController.view.addSubview(blurView)
        parentViewController.view.addSubview(self)
        
        setupAnimate()
    }
    
    private func setupAnimate() {
        alpha = 0
        blurView.alpha = 0
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5) {
            self.alpha = 1
            self.blurView.alpha = 1
            self.transform = .identity
        }
    }
    
    private func dismissAnimated() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.blurView.alpha = 0
        }) { _ in
            self.removeFromSuperview()
            self.blurView.removeFromSuperview()
            self.onClose?()
        }
    }
    
    private func setupUI() {
        addSubview(mainLabel)
        addSubview(rateTextField)
        addSubview(saveButton)
        backgroundColor = #colorLiteral(red: 0.1598874927, green: 0.1648692489, blue: 0.1861878335, alpha: 1)
        layer.cornerRadius = 20
    }
    
    private func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        blurView.effect = blurEffect
    }
    
    @objc private func handleTap() {
        endEditing(true)
    }
    
    @objc private func saveButtonTapped() {
        dismissAnimated()
    }
}

private extension RateView {
    func setConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(30)
            make.leading.equalTo(snp.leading).inset(5)
            make.trailing.equalTo(snp.trailing).inset(5)
        }
        
        rateTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(-50)
            make.leading.equalTo(snp.leading).inset(50)
            make.trailing.equalTo(snp.trailing).inset(50)
            make.height.equalTo(60)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(rateTextField.snp.bottom).inset(-50)
            make.leading.equalTo(snp.leading).inset(40)
            make.trailing.equalTo(snp.trailing).inset(40)
            make.height.equalTo(50)
        }
    }
}
