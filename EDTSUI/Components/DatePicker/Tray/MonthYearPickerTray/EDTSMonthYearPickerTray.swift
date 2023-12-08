//
//  EDTSMonthYearPickerTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 10/05/23.
//

import UIKit


internal class EDTSMonthYearPickerTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    
    public weak var datePicker: EDTSDatePicker?

    @IBOutlet weak var containerTray: UIView!
    @IBOutlet weak var containerTrayBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // default value: 10 years ago until 10 years ahead
    public var years = Array(
        Int(Date().f("yyyy"))! - 10
        ...
        Int(Date().f("yyyy"))! + 10
    )
    
    private let months = Array(1...12)

    
    public override init() {
        super.init(nibName: "EDTSMonthYearPickerTray", bundle: Bundle(for: EDTSMonthYearPickerTray.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "EDTSMonthYearPickerTray", bundle: Bundle(for: EDTSMonthYearPickerTray.self))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self
        self.pickerView.delegate = self
        self.pickerView.selectRow(0, inComponent: 0, animated: false)
    }
    
    public func setDate(_ date: Date?) {
        guard let date = date else { return }

        let month = Int(date.f("M"))!
        let year = Int(date.f("yyyy"))!
        self.pickerView.selectRow(self.months.firstIndex(of: month) ?? 0, inComponent: 0, animated: false)
        self.pickerView.selectRow(self.years.firstIndex(of: year) ?? 0, inComponent: 1, animated: false)
    }
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        var dateComponents = DateComponents()
        dateComponents.day = 1
        dateComponents.month = self.months[self.pickerView.selectedRow(inComponent: 0)]
        dateComponents.year = self.years[self.pickerView.selectedRow(inComponent: 1)]
                
        self.datePicker?.selected = Calendar.current.date(from: dateComponents)
        
        self.dismiss(animated: true)
    }
    
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func getMonthName(_ month: Int) -> String {
        switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "Mei"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Agu"
        case 9:
            return "Sep"
        case 10:
            return "Okt"
        case 11:
            return "Nov"
        case 12:
            return "Des"
        default:
            return "Unknown"
        }
    }
}


extension EDTSMonthYearPickerTray: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // month & year
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.months.count
        } else {
            return self.years.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return self.getMonthName(self.months[row])
        } else {
            return "\(self.years[row])"
        }
    }
}


