//
//  EDTSStepper.swift
//  EDTSUI
//
//  Created by Victor Toya on 05/10/22.
//

import UIKit

@IBDesignable public class EDTSStepper: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak public var btnSubtract: UIButton!
    @IBOutlet weak public var btnSubtractWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak public var btnSubtractHeightAnchor: NSLayoutConstraint!
    
    @IBOutlet weak public var btnAdd: UIButton!
    @IBOutlet weak public var btnAddWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak public var btnAddHeightAnchor: NSLayoutConstraint!
    
    @IBOutlet weak public var textfield: UITextField!
    @IBOutlet weak public var underline: UIImageView!
    
    @IBInspectable var leftIcon: UIImage {
        get {
            return btnSubtract.image(for: .normal) ?? UIImage()
        }
        set {
            btnSubtract.setImage(newValue.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    @IBInspectable var rigthIcon: UIImage {
        get {
            return btnAdd.image(for: .normal) ?? UIImage()
        }
        set {
            btnAdd.setImage(newValue.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
    
    @IBInspectable var text: String {
        get {
            return self.textfield.text ?? ""
        }
        set {
            self.textfield.text = newValue
        }
    }
    
    @IBInspectable var showUnderline: Bool {
        get {
            return isShowUnderline
        }
        set {
            isShowUnderline = newValue
            setupContent()
        }
    }
    
    @IBInspectable var textfieldFontName: String {
        get {
            return textFieldName
        }
        set {
            textFieldName = newValue
            setupView()
        }
    }
    
    @IBInspectable var textfieldFontSize: Int {
        get {
            return textFieldSize
        }
        set {
            textFieldSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var textfieldFontColor: UIColor {
        get {
            return textFieldColor
        }
        set {
            textFieldColor = newValue
            setupView()
        }
    }
    
    var isShowUnderline = true
    
    var textFieldName = "--"
    var textFieldSize = 14
    var textFieldColor = UIColor.black
    
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
        let frameworkBundle = Bundle(for: EDTSStepper.self)
        frameworkBundle.loadNibNamed("EDTSStepper", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        textfield.textColor = textFieldColor
        textfield.font = UIFont(name: textFieldName, size: CGFloat(textFieldSize)) ?? UIFont.systemFont(ofSize: CGFloat(textFieldSize))
    }
    
    private func setupContent() {
        if isShowUnderline {
            underline.isHidden = false
        } else {
            underline.isHidden = true
        }
    }
}
