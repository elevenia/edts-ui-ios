//
//  EDTSUIView.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//


import UIKit

/// `UIView` with additional functionalities for Interface Builder. Such as corner radius, border, shadow, etc.
@IBDesignable
public class EDTSUIView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Corner Radius
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    // MARK: - Border

    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.black.cgColor)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable
    public var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.black.cgColor)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    public var shadowOffsetX: CGFloat {
        get {
            return self.layer.shadowOffset.width
        }
        set {
            self.layer.shadowOffset = CGSize(
                width: newValue,
                height: self.shadowOffsetY
            )
        }
    }
    
    
    @IBInspectable
    public var shadowOffsetY: CGFloat {
        get {
            return self.layer.shadowOffset.height
        }
        set {
            self.layer.shadowOffset = CGSize(
                width: self.shadowOffsetX,
                height: newValue
            )
        }
    }
    
}
