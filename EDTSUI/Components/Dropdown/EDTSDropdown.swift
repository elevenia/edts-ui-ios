//
//  EDTSDropdown.swift
//  EDTSUI
//
//  Created by Kevin Hardianto on 30/11/22.
//

import UIKit

@IBDesignable public class EDTSDropdown: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak public var containerDropdown: UIView!
    @IBOutlet weak public var dropdownLabel: UILabel!
    @IBOutlet weak public var dropdownIcon: UIImageView!
    @IBOutlet weak public var dropdownPlaceholder: UILabel!
    @IBOutlet weak public var dropdownButton: UIButton!
    @IBOutlet weak public var helpText: UILabel!
    
    @IBOutlet weak var dropdownLabelHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var dropdownPlaceholderTopAnchor: NSLayoutConstraint!
    
    @IBInspectable var label: String {
        get {
            return self.dropdownLabel.text ?? ""
        }
        set {
            self.dropdownLabel.text = newValue
        }
    }
    
    @IBInspectable var icon: UIImage {
        get {
            return self.dropdownIcon.image ?? UIImage()
        }
        set {
            self.dropdownIcon.image = newValue
        }
    }
    
    @IBInspectable var placeholder: String {
        get {
            return self.dropdownPlaceholder.text ?? ""
        }
        set {
            self.dropdownPlaceholder.text = newValue
            self.placeholderLabel = newValue
        }
    }
    
    @IBInspectable var message: String {
        get {
            return helpText.text ?? ""
        }
        set {
            helpText.text = newValue
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
    
    @IBInspectable var showHelpText: Bool {
        get {
            return isShowHelpText
        }
        set {
            isShowHelpText = newValue
            setupContent()
        }
    }

    @IBInspectable var cornerRadius: Int {
        get {
            return dropdownCornerRadius
        }
        set {
            dropdownCornerRadius = newValue
            setupView()
        }
    }
    
    @IBInspectable var borderWidth: Int {
        get {
            return dropdownBorderWidth
        }
        set {
            dropdownBorderWidth = newValue
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
    
    @IBInspectable var labelFontName: String {
        get {
            return labelName
        }
        set {
            labelName = newValue
            setupView()
        }
    }

    @IBInspectable var labelFontSize: Int {
        get {
            return labelSize
        }
        set {
            labelSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var labelFontColor: UIColor {
        get {
            return labelColor
        }
        set {
            labelColor = newValue
            setupView()
        }
    }
    
    @IBInspectable var placeholderFontName: String {
        get {
            return placeholderName
        }
        set {
            placeholderName = newValue
            setupView()
        }
    }
    
    @IBInspectable var placeholderFontSize: Int {
        get {
            return placeholderSize
        }
        set {
            placeholderSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var placeholderFontColor: UIColor {
        get {
            return placeholderColor
        }
        set {
            placeholderColor = newValue
            setupView()
        }
    }
    
    @IBInspectable var helpTextFontName: String {
        get {
            return helpTextName
        }
        set {
            helpTextName = newValue
            setupView()
        }
    }
    
    @IBInspectable var helpTextFontSize: Int {
        get {
            return helpTextSize
        }
        set {
            helpTextSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var helpTextFontColor: UIColor {
        get {
            return helpTextColor
        }
        set {
            helpTextColor = newValue
            setupView()
        }
    }
    
    var isShowLabel = false
    var isShowHelpText = false
    
    var colorBorder = UIColor(red: 220.0/255.0, green: 222.0/255.0, blue: 227.0/255.0, alpha: 1.0)
    var colorBg = UIColor.clear
    
    var colorBorderError = UIColor(red: 238.0/255.0, green: 43.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    var colorBgError = UIColor(red: 255.0/255.0, green: 237.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    
    var dropdownCornerRadius = 4
    var dropdownBorderWidth = 1
    
    var placeholderLabel = ""
    var placeholderName = "--"
    var placeholderSize = 14
    var placeholderColor = UIColor(red: 156.0/255.0, green: 157.0/255.0, blue: 166.0/255.0, alpha: 1.0)
    var placeholderFilledColor = UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 35.0/255.0, alpha: 1.0)
    
    var labelName = "--"
    var labelSize = 12
    var labelColor = UIColor(red: 112.0/255.0, green: 114.0/255.0, blue: 125.0/255.0, alpha: 1.0)
    
    var helpTextName = "--"
    var helpTextSize = 10
    var helpTextColor = UIColor(red: 112.0/255.0, green: 114.0/255.0, blue: 125.0/255.0, alpha: 1.0)
    
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
        let frameworkBundle = Bundle(for: EDTSDropdown.self)
        frameworkBundle.loadNibNamed("EDTSDropdown", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        containerDropdown.layer.masksToBounds = true
        containerDropdown.layer.cornerRadius = CGFloat(dropdownCornerRadius)
        containerDropdown.layer.borderWidth = CGFloat(dropdownBorderWidth)
        containerDropdown.layer.borderColor = borderColor.cgColor
        
        dropdownLabel.textColor = labelColor
        dropdownLabel.font = UIFont(name: labelName, size: CGFloat(labelSize)) ?? UIFont.systemFont(ofSize: CGFloat(labelSize))
        
        if dropdownPlaceholder.text == placeholder {
            dropdownPlaceholder.textColor = placeholderColor
        } else {
            dropdownPlaceholder.textColor = placeholderFilledColor
        }
        
        dropdownPlaceholder.font = UIFont(name: placeholderName, size: CGFloat(placeholderSize)) ?? UIFont.systemFont(ofSize: CGFloat(placeholderSize))
        
        helpText.textColor = helpTextColor
        helpText.font = UIFont(name: helpTextName, size: CGFloat(helpTextSize)) ?? UIFont.systemFont(ofSize: CGFloat(helpTextSize))
    }
    
    private func setupContent() {
        if isShowLabel {
            dropdownLabel.isHidden = false
            dropdownLabelHeightAnchor.constant = 14
            dropdownPlaceholderTopAnchor.constant = 4
        } else {
            dropdownLabel.isHidden = true
            dropdownLabelHeightAnchor.constant = 0
            dropdownPlaceholderTopAnchor.constant = 0
        }
        
        if isShowHelpText {
            helpText.isHidden = false
        } else {
            helpText.isHidden = true
        }
    }
    
    public func setText(text: String) {
        setDefault()
        dropdownPlaceholder.text = text
        dropdownPlaceholder.textColor = placeholderFilledColor
    }
    
    public func setDefault() {
        containerDropdown.layer.borderColor = colorBorder.cgColor
        containerDropdown.backgroundColor = colorBg
        helpText.textColor = helpTextColor
        dropdownIcon.layer.opacity = 1
        dropdownButton.isEnabled = true
        dropdownPlaceholder.text = placeholderLabel
        dropdownPlaceholder.textColor = placeholderColor
    }
    
    public func setError() {
        containerDropdown.layer.borderColor = colorBorderError.cgColor
        containerDropdown.backgroundColor = colorBgError
        helpText.textColor = colorBorderError
        dropdownIcon.layer.opacity = 1
        dropdownButton.isEnabled = true
    }
    
    public func setDisabled() {
        setDefault()
        dropdownIcon.layer.opacity = 0.3
        dropdownButton.isEnabled = false
    }
}
