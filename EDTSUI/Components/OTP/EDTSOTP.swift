//
//  EDTSOTP.swift
//  EDTSUI
//
//  Created by Victor Toya on 23/09/22.
//

import UIKit

public protocol EDTSOTPDelegate: AnyObject {
    func onOTPCompleted(string: String)
    func onOTPIncomplete()
}

@IBDesignable public class EDTSOTP: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var textField1: EDTSOTPDigit!
    @IBOutlet weak var textField2: EDTSOTPDigit!
    @IBOutlet weak var textField3: EDTSOTPDigit!
    @IBOutlet weak var textField4: EDTSOTPDigit!
    @IBOutlet weak var textField5: EDTSOTPDigit!
    @IBOutlet weak var textField6: EDTSOTPDigit!
    
    @IBOutlet weak var containerUnderline: UIStackView!
    @IBOutlet weak var underline1: UIImageView!
    @IBOutlet weak var underline2: UIImageView!
    @IBOutlet weak var underline3: UIImageView!
    @IBOutlet weak var underline4: UIImageView!
    @IBOutlet weak var underline5: UIImageView!
    @IBOutlet weak var underline6: UIImageView!
    
    public weak var delegate: EDTSOTPDelegate?

    @IBInspectable var sixDigit: Bool {
        get {
            return isSixDigit
        }
        set {
            isSixDigit = newValue
            setupContent()
        }
    }
    
    @IBInspectable var secureEntry: Bool {
        get {
            return isSecureEntry
        }
        set {
            isSecureEntry = newValue
            setupContent()
        }
    }
    
    @IBInspectable var underlinedStyle: Bool {
        get {
            return isUnderlinedStyle
        }
        set {
            isUnderlinedStyle = newValue
            setupView()
            setupContent()
        }
    }
    
    @IBInspectable var cornerRadius: Int {
        get {
            return textfieldCornerRadius
        }
        set {
            textfieldCornerRadius = newValue
            setupView()
        }
    }
    
    @IBInspectable var borderWidth: Int {
        get {
            return 1
        }
        set {
            textfieldBorderWidth = newValue
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
    
    @IBInspectable var textFontName: String {
        get {
            return textfieldFontName
        }
        set {
            textfieldFontName = newValue
            setupView()
        }
    }

    @IBInspectable var textFontSize: Int {
        get {
            return textfieldFontSize
        }
        set {
            textfieldFontSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var textColor: UIColor {
        get {
            return textfieldColor
        }
        set {
            textfieldColor = newValue
            setupView()
        }
    }
    
    var isSixDigit = false
    var isSecureEntry = false
    var isUnderlinedStyle = false
    
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
    
    var textfieldFontName = "--"
    var textfieldFontSize = 28
    var textfieldColor = UIColor.black
    var textfieldCornerRadius = 4
    var textfieldBorderWidth = 1
    
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
        let frameworkBundle = Bundle(for: EDTSOTP.self)
        frameworkBundle.loadNibNamed("EDTSOTP", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        textField1.delegate = self
        textField1.digitDelegate = self
        textField1.keyboardType = .numberPad
        textField1.layer.borderColor = borderColor.cgColor
        textField1.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField1.font = getFont()
        textField1.textColor = textColor
        
        textField2.delegate = self
        textField2.digitDelegate = self
        textField2.keyboardType = .numberPad
        textField2.layer.borderColor = borderColor.cgColor
        textField2.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField2.font = getFont()
        textField2.textColor = textColor
        
        textField3.delegate = self
        textField3.digitDelegate = self
        textField3.keyboardType = .numberPad
        textField3.layer.borderColor = borderColor.cgColor
        textField3.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField3.font = getFont()
        textField3.textColor = textColor
        
        textField4.delegate = self
        textField4.digitDelegate = self
        textField4.keyboardType = .numberPad
        textField4.layer.borderColor = borderColor.cgColor
        textField4.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField4.font = getFont()
        textField4.textColor = textColor
        
        textField5.delegate = self
        textField5.digitDelegate = self
        textField5.keyboardType = .numberPad
        textField5.layer.borderColor = borderColor.cgColor
        textField5.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField5.font = getFont()
        textField5.textColor = textColor
        
        textField6.delegate = self
        textField6.digitDelegate = self
        textField6.keyboardType = .numberPad
        textField6.layer.borderColor = borderColor.cgColor
        textField6.layer.cornerRadius = CGFloat(textfieldCornerRadius)
        textField6.font = getFont()
        textField6.textColor = textColor
        
        underline1.backgroundColor = borderColor
        underline2.backgroundColor = borderColor
        underline3.backgroundColor = borderColor
        underline4.backgroundColor = borderColor
        underline5.backgroundColor = borderColor
        underline6.backgroundColor = borderColor
        
        if isUnderlinedStyle == true {
            textField1.layer.borderWidth = 0
            textField2.layer.borderWidth = 0
            textField3.layer.borderWidth = 0
            textField4.layer.borderWidth = 0
            textField5.layer.borderWidth = 0
            textField6.layer.borderWidth = 0
        } else {
            textField1.layer.borderWidth = CGFloat(textfieldBorderWidth)
            textField2.layer.borderWidth = CGFloat(textfieldBorderWidth)
            textField3.layer.borderWidth = CGFloat(textfieldBorderWidth)
            textField4.layer.borderWidth = CGFloat(textfieldBorderWidth)
            textField5.layer.borderWidth = CGFloat(textfieldBorderWidth)
            textField6.layer.borderWidth = CGFloat(textfieldBorderWidth)
        }
    }
    
    private func setupContent() {
        if isSixDigit {
            textField5.isHidden = false
            textField6.isHidden = false
            
            underline5.isHidden = false
            underline6.isHidden = false
        } else {
            textField5.isHidden = true
            textField6.isHidden = true
            
            underline5.isHidden = true
            underline6.isHidden = true
        }
        
        if isUnderlinedStyle == true {
            containerUnderline.isHidden = false
        } else {
            containerUnderline.isHidden = true
        }
        
        textField1.isSecureTextEntry = isSecureEntry
        textField2.isSecureTextEntry = isSecureEntry
        textField3.isSecureTextEntry = isSecureEntry
        textField4.isSecureTextEntry = isSecureEntry
        textField5.isSecureTextEntry = isSecureEntry
        textField6.isSecureTextEntry = isSecureEntry
    }
    
    private func getFont() -> UIFont {
        return UIFont(name: textfieldFontName, size: CGFloat(textfieldFontSize)) ?? UIFont.systemFont(ofSize: CGFloat(textfieldFontSize))
    }
    
    public func getPINValue() -> String? {
        if isSixDigit {
            if textField1.text != nil && textField1.text != ""
                && textField2.text != nil && textField2.text != ""
                && textField3.text != nil && textField3.text != ""
                && textField4.text != nil && textField4.text != ""
                && textField5.text != nil && textField5.text != ""
                && textField6.text != nil && textField6.text != "" {
                var string = textField1.text!
                string.append(textField2.text!)
                string.append(textField3.text!)
                string.append(textField4.text!)
                string.append(textField5.text!)
                string.append(textField6.text!)
                return string
            } else {
                return nil
            }
        } else {
            if textField1.text != nil && textField1.text != ""
                && textField2.text != nil && textField2.text != ""
                && textField3.text != nil && textField3.text != ""
                && textField4.text != nil && textField4.text != "" {
                var string = textField1.text!
                string.append(textField2.text!)
                string.append(textField3.text!)
                string.append(textField4.text!)
                return string
            } else {
                return nil
            }
        }
    }
    
    private func checkInputedPIN() {
        if isSixDigit {
            if textField1.text != nil && textField1.text != ""
                && textField2.text != nil && textField2.text != ""
                && textField3.text != nil && textField3.text != ""
                && textField4.text != nil && textField4.text != ""
                && textField5.text != nil && textField5.text != ""
                && textField6.text != nil && textField6.text != "" {
                var string = textField1.text!
                string.append(textField2.text!)
                string.append(textField3.text!)
                string.append(textField4.text!)
                string.append(textField5.text!)
                string.append(textField6.text!)
                self.delegate?.onOTPCompleted(string: string)
            } else {
                self.delegate?.onOTPIncomplete()
            }
        } else {
            if textField1.text != nil && textField1.text != ""
                && textField2.text != nil && textField2.text != ""
                && textField3.text != nil && textField3.text != ""
                && textField4.text != nil && textField4.text != "" {
                var string = textField1.text!
                string.append(textField2.text!)
                string.append(textField3.text!)
                string.append(textField4.text!)
                self.delegate?.onOTPCompleted(string: string)
            } else {
                self.delegate?.onOTPIncomplete()
            }
        }
    }
    
    public func setEmpty() {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
        textField3.resignFirstResponder()
        textField4.resignFirstResponder()
        
        textField1.text = ""
        textField2.text = ""
        textField3.text = ""
        textField4.text = ""
        
        if isSixDigit {
            textField5.resignFirstResponder()
            textField6.resignFirstResponder()
            
            textField5.text = ""
            textField6.text = ""
        }
    }
    
    public func setDefault() {
        if isUnderlinedStyle != true {
            setDefault(textfield: textField1)
            setDefault(textfield: textField2)
            setDefault(textfield: textField3)
            setDefault(textfield: textField4)
            setDefault(textfield: textField5)
            setDefault(textfield: textField6)
        }
    }
    
    private func setDefault(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorder.cgColor
        textfield.backgroundColor = colorBg
    }
    
    public func setError() {
        if isUnderlinedStyle != true {
            setError(textfield: textField1)
            setError(textfield: textField2)
            setError(textfield: textField3)
            setError(textfield: textField4)
            setError(textfield: textField5)
            setError(textfield: textField6)
        }
    }
    
    private func setError(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorderError.cgColor
        textfield.backgroundColor = colorBgError
    }
    
    public func setAutofill() {
        if isUnderlinedStyle != true {
            setAutofill(textfield: textField1)
            setAutofill(textfield: textField2)
            setAutofill(textfield: textField3)
            setAutofill(textfield: textField4)
            setAutofill(textfield: textField5)
            setAutofill(textfield: textField6)
        }
    }
    
    private func setAutofill(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorderAutofill.cgColor
        textfield.backgroundColor = colorBgAutofill
    }
    
    public func setSuccess() {
        if isUnderlinedStyle != true {
            setSuccess(textfield: textField1)
            setSuccess(textfield: textField2)
            setSuccess(textfield: textField3)
            setSuccess(textfield: textField4)
            setSuccess(textfield: textField5)
            setSuccess(textfield: textField6)
        }
    }
    
    private func setSuccess(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorderSuccess.cgColor
        textfield.backgroundColor = colorBgSuccess
    }
    
    public func setDisabled() {
        if isUnderlinedStyle != true {
            setDisabled(textfield: textField1)
            setDisabled(textfield: textField2)
            setDisabled(textfield: textField3)
            setDisabled(textfield: textField4)
            setDisabled(textfield: textField5)
            setDisabled(textfield: textField6)
        }
    }
    
    private func setDisabled(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorderDisable.cgColor
        textfield.backgroundColor = colorBgDisable
    }
    
    public func setFocused() {
        if isUnderlinedStyle != true {
            setFocused(textfield: textField1)
            setFocused(textfield: textField2)
            setFocused(textfield: textField3)
            setFocused(textfield: textField4)
            setFocused(textfield: textField5)
            setFocused(textfield: textField6)
        }
    }
    
    private func setFocused(textfield: EDTSOTPDigit) {
        textfield.layer.borderColor = colorBorderFocused.cgColor
        textfield.backgroundColor = colorBgFocused
    }
}

extension EDTSOTP: EDTSOTPDigitDelegate, UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        setDefault()
        setFocused(textfield: textField as! EDTSOTPDigit)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        setDefault(textfield: textField as! EDTSOTPDigit)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        if allowedCharacters.isSuperset(of: characterSet) {
            if updatedText.count <= 1 {
                return true
            } else {
                textFieldDidMove(textField, string: string)
                return false
            }
        } else {
            return false
        }
    }
    
    @objc public func textFieldDidChange(_ textfield: UITextField) {
        if textfield.text != nil && textfield.text != "" {
            if textfield == textField1 {
                checkInputedPIN()
                textField2.becomeFirstResponder()
            } else if textfield == textField2 {
                checkInputedPIN()
                textField3.becomeFirstResponder()
            } else if textfield == textField3 {
                checkInputedPIN()
                textField4.becomeFirstResponder()
            } else if textfield == textField4 {
                checkInputedPIN()
                textField5.becomeFirstResponder()
            } else if textfield == textField5 {
                checkInputedPIN()
                textField6.becomeFirstResponder()
            } else if textfield == textField6 {
                checkInputedPIN()
            }
        } else {
            textFieldDidBackspaced(textfield)
        }
    }
    
    public func textFieldDidBackspaced(_ textfield: UITextField) {
        setDefault()
        self.delegate?.onOTPIncomplete()
        if textfield == textField2 {
            textField1.becomeFirstResponder()
        } else if textfield == textField3 {
            textField2.becomeFirstResponder()
        } else if textfield == textField4 {
            textField3.becomeFirstResponder()
        } else if textfield == textField5 {
            textField4.becomeFirstResponder()
        } else if textfield == textField6 {
            textField5.becomeFirstResponder()
        }
    }
    
    func textFieldDidMove(_ textfield: UITextField, string: String) {
        if textfield == textField1 {
            textField2.becomeFirstResponder()
            textField2.text = string
            checkInputedPIN()
        } else if textfield == textField2 {
            textField3.becomeFirstResponder()
            textField3.text = string
            checkInputedPIN()
        } else if textfield == textField3 {
            textField4.becomeFirstResponder()
            textField4.text = string
            checkInputedPIN()
        } else if textfield == textField4 {
            textField5.becomeFirstResponder()
            textField5.text = string
            checkInputedPIN()
        } else if textfield == textField5 {
            textField6.becomeFirstResponder()
            textField6.text = string
            checkInputedPIN()
        } else if textfield == textField6 {
            checkInputedPIN()
        }
    }
    
    func textFieldDidDeleteBackward(_ textfield: UITextField) {
        if textfield.text == "" || textfield.text == nil {
            setDefault()
            self.delegate?.onOTPIncomplete()
            if textfield == textField2 {
                textField1.becomeFirstResponder()
            } else if textfield == textField3 {
                textField2.becomeFirstResponder()
            } else if textfield == textField4 {
                textField3.becomeFirstResponder()
            } else if textfield == textField5 {
                textField4.becomeFirstResponder()
            } else if textfield == textField6 {
                textField5.becomeFirstResponder()
            }
        }
    }
}
