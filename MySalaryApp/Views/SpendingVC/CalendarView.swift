//
//  CalendarView.swift
//  MySalaryApp
//
//  Created by Nikita Savchik on 13/09/2023.
//

import UIKit
import SnapKit

class CalendarView: UIView, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    private lazy var calendar: UICalendarView = {
        let calendar = UICalendarView()
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        calendar.selectionBehavior = dateSelection
        calendar.calendar = .current
        calendar.locale = .current
        calendar.fontDesign = .rounded
        calendar.layer.cornerRadius = 20
        return calendar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(calendar)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
    }
    
}

extension CalendarView {
    private func setConstraints() {
        calendar.snp.makeConstraints { make in
            make.top.equalTo(snp.top).inset(0)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(300)
        }
    }
}
