//
//  MainViewController.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 07/09/2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    let currentSalary = CurrentSalary()
    let expectedSalary = ExpectedSalary()
    let reservedSalary = ReservedAmount()
    let rateView = RateView()
    
    private lazy var backgroundImage: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        return background
    }()
    
    private lazy var addSpending: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить траты", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 20)
        button.setTitleColor(UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), for: .normal)
        button.addTarget(self, action: #selector(showAddSpendingVC), for: .touchUpInside)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSubviews(
            backgroundImage,
            currentSalary,
            expectedSalary,
            reservedSalary,
            addSpending,
            addDays
        )
        setupBarButton()
        setConstraints()
    }

    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
    }
    
    private func setupBarButton() {
        let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        settingsButton.setBackgroundImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        settingsButton.tintColor = .white
        settingsButton.addTarget(self, action: #selector(barButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingsButton)
    }
}

extension MainViewController {
    @objc private func showSpendingVC() {
        present(SpendingViewController(), animated: true)
    }
    
    @objc private func barButtonTapped() {
        let rateView = RateView(frame: CGRect(x: 0, y: 0, width: 300, height: 350))
        rateView.center = view.center
        rateView.onClose = {
            self.navigationItem.rightBarButtonItem?.isHidden = false
        }
        rateView.showAnimated(on: self)
        
        navigationItem.rightBarButtonItem?.isHidden = true
    }
    
    @objc private func showAddSpendingVC() {
        let addSpendingVC = AddSpendingViewController()
        if let sheet = addSpendingVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 20
        }
        present(addSpendingVC, animated: true)
    }
}

private extension MainViewController {
    func setConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(0)
            make.leading.equalTo(view.snp.leading).inset(0)
            make.trailing.equalTo(view.snp.trailing).inset(0)
            make.bottom.equalTo(view.snp.bottom).inset(0)
            
        }
        
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
