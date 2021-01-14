//
//  ViewController.swift
//  CustomCalendarTime
//
//  Created by miori Lee on 2021/01/14.
//

import UIKit

class ViewController: UIViewController {
    
     
    @IBAction func didTapCalendar(_ sender: Any) {
        let calendarView = CalendarTimeViewController()
        calendarView.modalPresentationStyle = .overCurrentContext
        self.present(calendarView, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
        
    }
}
    
 
