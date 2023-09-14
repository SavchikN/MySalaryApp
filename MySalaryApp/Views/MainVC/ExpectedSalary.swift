//
//  ExpectedSalary.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 08/09/2023.
//

import UIKit
import SnapKit

class ExpectedSalary: UIView {
    
    private let firstTitle: UILabel = {
        let title = UILabel()
        title.text = "В этом месяце ожидается"
        title.font = UIFont(name: "Avenir Next Medium", size: 20)
        title.textColor = .gray
        return title
    }()
    
    private let expectedSalary: UILabel = {
        let label = UILabel()
        label.text = "$1190.42"
        label.font = UIFont(name: "Avenir Next Bold", size: 30)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews(firstTitle, expectedSalary)
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
        
        expectedSalary.snp.makeConstraints { make in
            make.top.equalTo(firstTitle.snp.bottom).inset(-5)
            make.leading.equalTo(snp.leading).inset(0)
            make.trailing.equalTo(snp.trailing).inset(0)
        }
    }
}
