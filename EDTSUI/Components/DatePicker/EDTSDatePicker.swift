//
//  EDTSDatePicker.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 10/05/23.
//

import UIKit

public class EDTSDatePicker: UIView {
    
    @IBInspectable
    public var icon: UIImage? = nil {
        didSet {
            self.updateIcon()
        }
    }
    
    @IBInspectable
    public var label: String? {
        didSet {
            self.updateTextField()
        }
    }
    
    public weak var parentVC: UIViewController?
    public var type: EDTSDatePickerType = .dateMonthYear
    public var options: [Date] = []
    public var selected: Date? = nil {
        didSet {
            self.didSetSelected()
        }
    }
    public var onChange: ((Date?) -> Void)?
    
    
    // Use this closure to perform some actions on the tray, such as styling, etc.
    public var onShowDatePickerTray: ((EDTSDatePickerTray) -> Void)?
    public var onShowMonthYearPickerTray: ((EDTSMonthYearPickerTray) -> Void)?

    
    @IBOutlet public weak var edtsTextField: EDTSTextField!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupHandlers()
    }
    
    private func setupUI() {
        let contentView = Bundle(for: EDTSDatePicker.self).loadNibNamed("EDTSDatePicker", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        self.updateTextField()
        self.updateIcon()
    }

    private func setupHandlers() {
        self.edtsTextField.isUserInteractionEnabled = true
        self.edtsTextField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTextField)))
        self.edtsTextField.textfieldText.isUserInteractionEnabled = false
        self.edtsTextField.textfieldButton.addTarget(self, action: #selector(didTapTextField), for: .touchUpInside)
    }
    
    private func updateTextField() {
        if let label = label, edtsTextField != nil {
            self.edtsTextField.textfieldLabel.text = label
            self.edtsTextField.textfieldText.placeholder = label
        }
    }
    
    private func updateIcon() {
        if let icon, edtsTextField != nil {
            self.edtsTextField.textfieldButton.setImage(icon.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    private func didSetSelected() {
        switch self.type {
        case .dateMonthYear:
            self.edtsTextField.textfieldText.text = self.selected?.f("d MMMM yyyy")
        case .monthYear:
            self.edtsTextField.textfieldText.text = self.selected?.f("MMMM yyyy")
        }
    }
    
    @objc func didTapTextField() {
        switch self.type {
        case .dateMonthYear:
            let tray = EDTSDatePickerTray()
            tray.datePicker = self
            self.parentVC?.present(tray, animated: false) { [unowned self] in
                tray.titleLabel.text = self.label
                tray.setDate(self.selected)
                self.onShowDatePickerTray?(tray)
            }
        case .monthYear:
            let tray = EDTSMonthYearPickerTray()
            tray.datePicker = self
            self.parentVC?.present(tray, animated: false) { [unowned self] in
                tray.titleLabel.text = self.label
                tray.setDate(self.selected)
                self.onShowMonthYearPickerTray?(tray)
            }
        }
    }
    
    public enum EDTSDatePickerType {
        case dateMonthYear
        case monthYear
    }
}




