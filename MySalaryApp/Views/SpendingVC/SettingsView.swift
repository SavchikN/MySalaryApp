//
//  SettingsView.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 14/09/2023.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    
    private lazy var workedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Отработанное время:"
        label.font = UIFont(name: "Avenir Next Medium", size: 25)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var workedTimeTextField: UITextField = {
        let time = UITextField()
        time.backgroundColor = .clear
        time.layer.borderWidth = 1
        time.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        time.layer.cornerRadius = 20
        time.textColor = .white
        time.keyboardType = .decimalPad
        time.textAlignment = .center
        time.font = UIFont(name: "Avenir Next Medium", size: 30)
        return time
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 20)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(
            workedTimeLabel,
            workedTimeTextField,
            addButton
        )
        
        setConstraints()
        hideKeyboard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        endEditing(true)
    }
    
    @objc private func addButtonTapped() {
        print("add")
    }
}

private extension SettingsView {
    func setConstraints() {
        workedTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.leading.equalTo(snp.leading).inset(15)
            make.width.equalTo(180)
        }
        
        workedTimeTextField.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(5)
            make.leading.equalTo(workedTimeLabel.snp.trailing).inset(-60)
            make.height.equalTo(60)
            make.width.equalTo(100)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(workedTimeTextField.snp.bottom).inset(-60)
            make.leading.equalTo(snp.leading).inset(40)
            make.trailing.equalTo(snp.trailing).inset(40)
            make.height.equalTo(50)
        }
    }
}
