//
//  CurrentSalary.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 07/09/2023.
//

import UIKit
import SnapKit

class CurrentSalary: UIView {
    
    private let firstTitle: UILabel = {
        let title = UILabel()
        title.text = "Уже заработано"
        title.font = UIFont(name: "Avenir Next Medium", size: 25)
        title.textColor = .white
        return title
    }()
    
    private let currentSalary: UILabel = {
        let label = UILabel()
        label.text = "$661.33"
        label.font = UIFont(name: "Avenir Next Bold", size: 50)
        label.textColor = #colorLiteral(red: 0.3011294901, green: 0.8425379395, blue: 0.5879539251, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(firstTitle, currentSalary)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
    }
    
    private func setConstraints() {
        firstTitle.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
        }
        
        currentSalary.snp.makeConstraints { make in
            make.top.equalTo(firstTitle.snp.bottom).inset(-5)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
        }
    }
}
