//
//  AddSpendingViewController.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 20/09/2023.
//

import UIKit

class AddSpendingViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавьте ваши ежемесячные траты"
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var addTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.borderWidth = 1
        textField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        textField.font = UIFont(name: "Avenir Next Bold", size: 30)
        return textField
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1598874927, green: 0.1648692489, blue: 0.1861878335, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(addTextField)
        view.addSubview(saveButton)
        setConstraints()
    }
    
    @objc private func saveButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(10)
            make.leading.equalTo(view.snp.leading).inset(10)
            make.trailing.equalTo(view.snp.trailing).inset(-10)
        }
        
        addTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-30)
            make.leading.equalTo(view.snp.leading).inset(100)
            make.trailing.equalTo(view.snp.trailing).inset(100)
            make.height.equalTo(60)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(addTextField.snp.bottom).inset(-25)
            make.leading.equalTo(view.snp.leading).inset(80)
            make.trailing.equalTo(view.snp.trailing).inset(80)
        }
    }
}
