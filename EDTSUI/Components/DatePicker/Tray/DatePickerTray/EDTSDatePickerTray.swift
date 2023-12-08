//
//  EDTSDatePickerTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 10/05/23.
//

import UIKit


internal class EDTSDatePickerTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet weak var containerTray: UIView!
    @IBOutlet weak var containerTrayBottomAnchor: NSLayoutConstraint!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var uiDatePicker: UIDatePicker!
    
    public weak var datePicker: EDTSDatePicker?
    
    public override init() {
        super.init(nibName: "EDTSDatePickerTray", bundle: Bundle(for: EDTSDatePickerTray.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "EDTSDatePickerTray", bundle: Bundle(for: EDTSDatePickerTray.self))
    }
    
    override func viewDidLoad() {
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

