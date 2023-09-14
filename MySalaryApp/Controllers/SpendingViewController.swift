//
//  SpendingViewController.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 08/09/2023.
//

import UIKit
import SnapKit

class SpendingViewController: UIViewController {
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Добавьте рабочие дни:"
        label.font = UIFont(name: "Avenir Next Medium", size: 25)
        label.textColor = .white
        return label
    }()
    
    private let calendarView = CalendarView()
    private let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.1598874927, green: 0.1648692489, blue: 0.1861878335, alpha: 1)
        
        setupSubviews(
            mainTitle,
            calendarView,
            settingsView
        )
        setConstraints()
        
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
}

extension SpendingViewController {
    private func setConstraints() {
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).inset(20)
            make.leading.equalTo(view.snp.leading).inset(50)
            make.trailing.equalTo(view.snp.trailing).inset(50)
        }
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).inset(-20)
            make.leading.equalTo(view.snp.leading).inset(10)
            make.trailing.equalTo(view.snp.trailing).inset(10)
            make.height.equalTo(300)
        }
        
        settingsView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).inset(-40)
            make.leading.equalTo(view.snp.leading).inset(10)
            make.trailing.equalTo(view.snp.trailing).inset(10)
            make.height.equalTo(200)
        }
    }
}
