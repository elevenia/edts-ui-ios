//
//  EDTSDatePickerTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 10/05/23.
//

import UIKit


public class EDTSDatePickerTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet public weak var containerTray: UIView!
    @IBOutlet public weak var containerTrayBottomAnchor: NSLayoutConstraint!

    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var uiDatePicker: UIDatePicker!
    
    public weak var datePicker: EDTSDatePicker?
    
    public override init() {
        super.init(nibName: "EDTSDatePickerTray", bundle: Bundle(for: EDTSDatePickerTray.self))
    }
    
    public required init?(coder: NSCoder) {
        super.init(nibName: "EDTSDatePickerTray", bundle: Bundle(for: EDTSDatePickerTray.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self
    }
    
    public func setDate(_ date: Date?) {
        guard let date = date else { return }

        self.uiDatePicker.date = date
    }
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        self.datePicker?.selected = uiDatePicker.date
        self.datePicker?.onChange?(uiDatePicker.date)
        
        self.dismiss(animated: true)
    }
    
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

