//
//  HeaderView.swift
//  CustomCalendarTime
//
//  Created by miori Lee on 2021/01/14.
//

import UIKit

class HeaderView: UIView {
    
    //MARK: - HEADER
    @IBOutlet weak var monthLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "eng")
        // mmmm : 달 full name 나옴
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM y")
        return dateFormatter
    }()
    
    var baseDate = Date() {
        didSet {
            monthLabel.text = dateFormatter.string(from: baseDate)
        }
    }
    

    
}
