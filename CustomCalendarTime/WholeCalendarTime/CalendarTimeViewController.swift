//
//  CalendarTimeViewController.swift
//  CustomCalendarTime
//
//  Created by miori Lee on 2021/01/15.
//

import UIKit

protocol CalendarViewControllerDeleagte {
    func didSelectDate(dateString: String)
}

class CalendarTimeViewController: UIViewController{
    
    @IBAction func didTapPreview(_ sender: Any) {
        currentMonthIndex -= 1
        
        if currentMonthIndex < 0 {
            currentMonthIndex = 11
            currentYear -= 1
        }
        
        
        selectedDateLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
        //for leap year, make february month of 29 days
        if currentMonthIndex == 1 {
            
            if currentYear % 4 == 0 {
                numOfDaysInMonth[currentMonthIndex] = 29
                
            } else {
                numOfDaysInMonth[currentMonthIndex] = 28
            }
        }
        //end
        
        //leftButton.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)// Disable left button if user is on current month
        firstWeekDayOfMonth = getFirstWeekDay()
        collectionView.reloadData()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        currentMonthIndex += 1
        
        if currentMonthIndex > 11 {
            currentMonthIndex = 0
            currentYear += 1
        }
        
        selectedDateLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
        
        //for leap year, make february month of 29 days
        if currentMonthIndex == 1 {
            
            if currentYear % 4 == 0 {
                numOfDaysInMonth[currentMonthIndex] = 29
                
            } else {
                numOfDaysInMonth[currentMonthIndex] = 28
            }
        }
        //end
        
        firstWeekDayOfMonth = getFirstWeekDay()
        collectionView.reloadData()
    }
    @IBAction func didTapCancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func didTapTime(_ sender: Any) {
        print("tapped")
        self.bodyView.bringSubviewToFront(self.pickerStackView)
        pickerStackView.isHidden = false
    }
    @IBAction func timeFixBtn(_ sender: Any) {
        let row = self.timePicker.selectedRow(inComponent: 0)
        self.timePicker.selectRow(row, inComponent: 0, animated: false)
        self.timeBtn.setTitle(self.times[row], for: .normal)
        let row2 = self.minPicker.selectedRow(inComponent: 0)
        self.minPicker.selectRow(row2, inComponent: 0, animated: false)
        self.minBtn.setTitle(self.mins[row2], for: .normal)
        self.pickerStackView.isHidden = true
    }
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pickerStackView: UIStackView! {
        didSet {
            makeBorderRadius(pickerStackView, cR: 10, bW: 0.5, color: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor)
        }
    }
    @IBOutlet weak var timePicker: UIPickerView! {
        didSet {
            timePicker.tag = 0
            timePicker.delegate = self
            timePicker.dataSource = self
        }
    }
    @IBOutlet weak var minPicker: UIPickerView! {
        didSet {
            minPicker.tag = 1
            minPicker.delegate = self
            minPicker.dataSource = self
        }
    }
    
    @IBOutlet weak var toolbarView: UIView! {
        didSet {
            toolbarView.roundCorners([.topRight, .topLeft], radius: 10)
        }
    }
    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var minBtn: UIButton!
    @IBOutlet weak var amORpmView: UIStackView! {
        didSet {
            makeBorderRadius(amORpmView, cR: 10, bW: 0.5, color: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor)
        }
    }
    @IBOutlet weak var hourView: UIView! {
        didSet {
            makeBorderRadius(hourView, cR: 10, bW: 0.5, color: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor)
        }
    }
    @IBOutlet weak var minView: UIView!{
        didSet {
            makeBorderRadius(minView, cR: 10, bW: 0.5, color: UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor)
        }
    }
    
    var times = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var mins = ["00","30"]
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    
    var delegate: CalendarViewControllerDeleagte?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllerUI()
        setupCalendar()
        
        selectedDateLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
        
        pickerStackView.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - UIVIewController helper Methods
    
    func setupCalendar() {
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentMonthIndex -= 1 // bcz apple calendar returns months starting from 1
        
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
        //for leap years, make february month of 29 days
        if currentMonthIndex == 1 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex] = 29
        }
        //end
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        // display current month name in title
        //topMonthButton.setTitle("\(months[currentMonthIndex]) \(currentYear)", for: .normal)
        //leftButton.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear) // Disable left button if user is on current month
    }
    
    func setupViewControllerUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        //topView.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.0862745098, blue: 0.1803921569, alpha: 1)
    }
    
    
    // Private Methods
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex+1)-01".date?.firstDayOfTheMonth.weekday)!
        //return day == 7 ? 1 : day
        return day
    }
}

extension CalendarTimeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DateCollectionViewCell.cellForCollectionView(collectionView: collectionView, indexPath: indexPath)
        
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
            return cell
            
        } else {
            
            let calcDate = indexPath.row-firstWeekDayOfMonth+2
            cell.isHidden = false
            cell.dateLabel.textColor = .black
            cell.dateLabel.text="\(calcDate)"
            
            if let date = String.dateFormatter.date(from: "\(currentYear)-\(currentMonthIndex+1)-\(calcDate)") {
                
                
                cell.isUserInteractionEnabled = true
                cell.backGroundImgView.isHidden = true
                cell.dateLabel.textColor = .black
                //cell.eventView.isHidden = true
                
                
            }
            
            
            // If you want to disable the previous dates of current month
            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                //cell.isUserInteractionEnabled=false
                
            } else {
                //cell.isUserInteractionEnabled=true
            }
        }
        
        return cell
    }
    
    // MARK: - UICollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? DateCollectionViewCell
        cell?.backGroundImgView.isHidden = false
        cell?.backGroundImgView.image = #imageLiteral(resourceName: "Ellipse 35")
        cell?.dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //selectedDateLabel.text = "\(months[currentMonthIndex]) \(currentYear)"
        
        if let date = cell?.dateLabel.text! {
            print("\(currentYear)-\(currentMonthIndex+1)-\(date)")
            
            // If you want to pass the selected date to previous viewController, use following delegate
            self.delegate?.didSelectDate(dateString: "\(currentYear)-\(currentMonthIndex+1)-\(date)")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? DateCollectionViewCell
        cell?.backGroundImgView.isHidden = true
        cell?.dateLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarTimeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/7 , height: collectionView.frame.width/7 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension CalendarTimeViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return times.count
        case 1:
            return mins.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return times[row]
        case 1:
            return mins[row]
        default:
            return "nil"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            print("\(times[row])")
        case 1:
            print("\(mins[row])")
        default:
            print("default")
        }
    }
    
    
    
}

extension CalendarTimeViewController {
    
    func makeBorderRadius(_ view : UIView, cR : CGFloat, bW : CGFloat, color : CGColor){
        view.layer.cornerRadius = cR
        view.layer.borderColor = color
        view.layer.borderWidth = bW
    }
}




