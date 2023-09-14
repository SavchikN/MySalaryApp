//
//  MainViewController.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 07/09/2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var addSpending: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить траты", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.setTitleColor(UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        return button
    }()
    
    private lazy var addDays: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить день", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.setTitleColor(UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), for: .normal)
        button.addTarget(self, action: #selector(showSpendingVC), for: .touchUpInside)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        return button
    }()
    
    let currentSalary = CurrentSalary()
    let expectedSalary = ExpectedSalary()
    let reservedSalary = ReservedAmount()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupSubviews(
            currentSalary,
            expectedSalary,
            reservedSalary,
            addSpending,
            addDays
        )
        setConstraints()
    }

    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
}

extension MainViewController {
    @objc private func showSpendingVC() {
        present(SpendingViewController(), animated: true)
    }
}

extension MainViewController {
    private func setConstraints() {
        currentSalary.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(150)
            make.leading.equalTo(view.snp.leading).inset(20)
            make.trailing.equalTo(view.snp.trailing).inset(-30)
        }
        
        expectedSalary.snp.makeConstraints { make in
            make.top.equalTo(currentSalary.snp.bottom).inset(-110)
            make.leading.equalTo(view.snp.leading).inset(20)
            make.trailing.equalTo(view.snp.trailing).inset(-30)
        }
        
        reservedSalary.snp.makeConstraints { make in
            make.top.equalTo(expectedSalary.snp.bottom).inset(-80)
            make.leading.equalTo(view.snp.leading).inset(20)
            make.trailing.equalTo(view.snp.trailing).inset(-30)
        }
        
        addSpending.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(40)
            make.leading.equalTo(view.snp.leading).inset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.height.equalTo(50)
        }
        
        addDays.snp.makeConstraints { make in
            make.bottom.equalTo(addSpending.snp.top).inset(-20)
            make.leading.equalTo(view.snp.leading).inset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.height.equalTo(50)
        }
    }
}
