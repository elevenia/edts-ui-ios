//
//  EDTSTextField.swift
//  EDTSUI
//
//  Created by Victor Toya on 20/09/22.
//

import UIKit

@IBDesignable public class EDTSTextField: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var containerTextfield: UIView!
    @IBOutlet weak var textfieldIcon: UIImageView!
    @IBOutlet weak var textfieldButton: UIButton!
    @IBOutlet weak var textfieldLabel: UILabel!
    @IBOutlet weak var textfieldText: UITextField!
    
    @IBOutlet weak var helptext: UILabel!
    
    @IBOutlet weak var textfieldIconWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldButtonWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldButtonTrailingAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldLabelLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldLabelHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldTextLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var textfieldTextTopAnchor: NSLayoutConstraint!
    
    @IBInspectable var label: String {
        get {
            return self.textfieldLabel.text ?? ""
        }
        set {
            self.textfieldLabel.text = newValue
        }
    }
    
    @IBInspectable var icon: UIImage {
        get {
            return self.textfieldIcon.image ?? UIImage()
        }
        set {
            self.textfieldIcon.image = newValue
        }
    }
    
    @IBInspectable var button: UIImage {
        get {
            return self.textfieldButton.image(for: .normal) ?? UIImage()
        }
        set {
            self.textfieldButton.setImage(newValue, for: .normal)
        }
    }
    
    @IBInspectable var message: String {
        get {
            return helptext.text ?? ""
        }
        set {
            helptext.text = newValue
        }
    }
    
    @IBInspectable var showLabel: Bool {
        get {
            return isShowLabel
        }
        set {
            isShowLabel = newValue
            setupContent()
        }
    }
    
    @IBInspectable var showIcon: Bool {
        get {
            return isShowIcon
        }
        set {
            isShowIcon = newValue
            setupContent()
        }
    }
    
    @IBInspectable var showButton: Bool {
        get {
            return isShowButton
        }
        set {
            isShowButton = newValue
            setupContent()
        }
    }

    @IBInspectable var cornerRadius: Int {
        get {
            return textFieldCornerRadius
        }
        set {
            textFieldCornerRadius = newValue
            setupView()
        }
    }
    
    @IBInspectable var borderWidth: Int {
        get {
            return textFieldBorderWidth
        }
        set {
            textFieldBorderWidth = newValue
            setupView()
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return colorBorder
        }
        set {
            colorBorder = newValue
            setupView()
        }
    }
    
    @IBInspectable var stateError: UIColor {
        get {
            return colorBorderError
        }
        set {
            colorBorderError = newValue
        }
    }
    
    @IBInspectable var stateErrorBg: UIColor {
        get {
            return colorBgError
        }
        set {
            colorBgError = newValue
        }
    }
    
    @IBInspectable var stateAutofill: UIColor {
        get {
            return colorBorderAutofill
        }
        set {
            colorBorderAutofill = newValue
        }
    }
    
    @IBInspectable var stateAutofillBg: UIColor {
        get {
            return colorBgAutofill
        }
        set {
            colorBgAutofill = newValue
        }
    }
    
    @IBInspectable var stateSuccess: UIColor {
        get {
            return colorBorderSuccess
        }
        set {
            colorBorderSuccess = newValue
        }
    }
    
    @IBInspectable var stateSuccessBg: UIColor {
        get {
            return colorBgSuccess
        }
        set {
            colorBgSuccess = newValue
        }
    }
    
    @IBInspectable var stateDisable: UIColor {
        get {
            return colorBorderDisable
        }
        set {
            colorBorderDisable = newValue
        }
    }
    
    @IBInspectable var stateDisableBg: UIColor {
        get {
            return colorBgDisable
        }
        set {
            colorBgDisable = newValue
        }
    }
    
    @IBInspectable var stateFocused: UIColor {
        get {
            return colorBorderFocused
        }
        set {
            colorBorderFocused = newValue
        }
    }
    
    @IBInspectable var stateFocusedBg: UIColor {
        get {
            return colorBgFocused
        }
        set {
            colorBgFocused = newValue
        }
    }
    
    @IBInspectable var fontLabel: UIFont {
        get {
            return textfieldLabel.font
        }
        set {
            textfieldLabel.font = newValue
        }
    }
    
    @IBInspectable var fontTextfield: UIFont {
        get {
            return textfieldText.font ?? UIFont.systemFont(ofSize: 12)
        }
        set {
            textfieldText.font = newValue
        }
    }
    
    @IBInspectable var fontHelpText: UIFont {
        get {
            return helptext.font
        }
        set {
            helptext.font = newValue
        }
    }
    
    @IBInspectable var colorLabel: UIColor {
        get {
            return textfieldLabel.textColor
        }
        set {
            textfieldLabel.textColor = newValue
        }
    }
    
    @IBInspectable var colorTextField: UIColor {
        get {
            return textfieldText.textColor ?? UIColor.black
        }
        set {
            textfieldText.textColor = newValue
        }
    }
    
    @IBInspectable var colorHelpText: UIColor {
        get {
            return helptext.textColor
        }
        set {
            helptext.textColor = newValue
        }
    }
    
    var isShowLabel = false
    var isShowIcon = false
    var isShowButton = false
    
    var colorBorder = UIColor(red: 220.0/255.0, green: 222.0/255.0, blue: 227.0/255.0, alpha: 1.0)
    var colorBg = UIColor.clear
    
    var colorBorderError = UIColor(red: 238.0/255.0, green: 43.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    var colorBgError = UIColor(red: 255.0/255.0, green: 237.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    
    var colorBorderAutofill = UIColor(red: 255.0/255.0, green: 125.0/255.0, blue: 29.0/255.0, alpha: 1.0)
    var colorBgAutofill = UIColor(red: 255.0/255.0, green: 254.0/255.0, blue: 197.0/255.0, alpha: 1.0)
    
    var colorBorderSuccess = UIColor(red: 143.0/255.0, green: 199.0/255.0, blue: 66.0/255.0, alpha: 1.0)
    var colorBgSuccess = UIColor(red: 231.0/255.0, green: 246.0/255.0, blue: 209.0/255.0, alpha: 1.0)
    
    var colorBorderDisable = UIColor(red: 239.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    var colorBgDisable = UIColor(red: 239.0/255.0, green: 243.0/255.0, blue: 246.0/255.0, alpha: 1.0)
    
    var colorBorderFocused = UIColor(red: 17.0/255.0, green: 120.0/255.0, blue: 212.0/255.0, alpha: 1.0)
    var colorBgFocused = UIColor.clear
    
    var textFieldCornerRadius = 4
    var textFieldBorderWidth = 1
    
    public var text: String? {
        return textfieldText.text
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
        setupView()
    }
    
    private func setupNib() {
        let frameworkBundle = Bundle(for: EDTSTextField.self)
        frameworkBundle.loadNibNamed("EDTSTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        containerTextfield.layer.masksToBounds = true
        containerTextfield.layer.cornerRadius = CGFloat(textFieldCornerRadius)
        containerTextfield.layer.borderWidth = CGFloat(textFieldBorderWidth)
        containerTextfield.layer.borderColor = borderColor.cgColor
    }
    
    private func setupContent() {
        if isShowIcon {
            textfieldIcon.isHidden = false
            textfieldIconWidthAnchor.constant = 24
            textfieldLabelLeadingAnchor.constant = 12
            textfieldTextLeadingAnchor.constant = 12
        } else {
            textfieldIcon.isHidden = true
            textfieldIconWidthAnchor.constant = 0
            textfieldLabelLeadingAnchor.constant = 0
            textfieldTextLeadingAnchor.constant = 0
        }
        
        if isShowLabel {
            textfieldLabel.isHidden = false
            textfieldLabelHeightAnchor.constant = 14
            textfieldTextTopAnchor.constant = 4
        } else {
            textfieldLabel.isHidden = true
            textfieldLabelHeightAnchor.constant = 0
            textfieldTextTopAnchor.constant = 0
        }
        
        if isShowButton {
            textfieldButton.isHidden = false
            textfieldButtonWidthAnchor.constant = 24
            textfieldButtonTrailingAnchor.constant = 16
        } else {
            textfieldButton.isHidden = true
            textfieldButtonWidthAnchor.constant = 0
            textfieldButtonTrailingAnchor.constant = 0
        }
    }
    
    public func setDefault() {
        containerTextfield.layer.borderColor = colorBorder.cgColor
        containerTextfield.backgroundColor = colorBg
    }
    
    public func setError() {
        containerTextfield.layer.borderColor = colorBorderError.cgColor
        containerTextfield.backgroundColor = colorBgError
    }
    
    public func setAutofill() {
        containerTextfield.layer.borderColor = colorBorderAutofill.cgColor
        containerTextfield.backgroundColor = colorBgAutofill
    }
    
    public func setSuccess() {
        containerTextfield.layer.borderColor = colorBorderSuccess.cgColor
        containerTextfield.backgroundColor = colorBgSuccess
    }
    
    public func setDisabled() {
        containerTextfield.layer.borderColor = colorBorderDisable.cgColor
        containerTextfield.backgroundColor = colorBgDisable
    }
    
    public func setFocused() {
        containerTextfield.layer.borderColor = colorBorderFocused.cgColor
        containerTextfield.backgroundColor = colorBgFocused
    }
    
}
