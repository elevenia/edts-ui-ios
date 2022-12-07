//
//  EDTSDropzone.swift
//  EDTSUI
//
//  Created by Kevin Hardianto on 05/12/22.
//

import UIKit

@IBDesignable public class EDTSDropZone: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak public var containerDropzone: UIView!
    @IBOutlet weak public var dropzoneImageDefault: UIImageView!
    @IBOutlet weak public var dropzoneImagePhoto: UIImageView!
    @IBOutlet weak public var dropzoneButton: UIButton!
    @IBOutlet weak public var containerLabel: UIView!
    @IBOutlet weak public var dropzoneLabel: UILabel!
    
    @IBInspectable var label: String {
        get {
            return self.dropzoneLabel.text ?? ""
        }
        set {
            self.dropzoneLabel.text = newValue
        }
    }
    
    @IBInspectable var defaultPhoto: UIImage {
        get {
            return self.photoDefault
        }
        set {
            self.dropzoneImageDefault.image = newValue
            self.photoDefault = newValue
        }
    }
    
    @IBInspectable var errorPhoto: UIImage {
        get {
            return self.photoError 
        }
        set {
            self.photoError = newValue
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
    
    @IBInspectable var stateDefaultBg: UIColor {
        get {
            return colorBg
        }
        set {
            colorBg = newValue
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
    
    @IBInspectable var labelBgColor: UIColor {
        get {
            return containerLabelColor
        }
        set {
            containerLabelColor = newValue
            setupView()
        }
    }
    
    var isShowLabel = false
    var isDefault = true
    
    var dropzoneCornerRadius = 4
    
    var colorBg = UIColor(red: 248.0/255.0, green: 251.0/255.0, blue: 252.0/255.0, alpha: 1.0)
    
    var colorBgError = UIColor(red: 255.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    
    var labelName = "--"
    var labelSize = 12
    var labelColor = UIColor.white
    
    var photoDefault = UIImage()
    var photoError = UIImage()
    
    var containerLabelColor = UIColor(red: 92.0/255.0, green: 148.0/255.0, blue: 15.0/255.0, alpha: 1.0)
    
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
        let frameworkBundle = Bundle(for: EDTSDropZone.self)
        frameworkBundle.loadNibNamed("EDTSDropZone", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        containerDropzone.layer.masksToBounds = true
        containerDropzone.layer.cornerRadius = CGFloat(dropzoneCornerRadius)
        
        containerLabel.backgroundColor = containerLabelColor
        
        dropzoneLabel.textColor = labelColor
        dropzoneLabel.font = UIFont(name: labelName, size: CGFloat(labelSize)) ?? UIFont.systemFont(ofSize: CGFloat(labelSize))
    }
    
    private func setupContent() {
        if isDefault {
            containerLabel.isHidden = true
            dropzoneLabel.isHidden = true
            dropzoneImagePhoto.isHidden = true
            dropzoneImageDefault.isHidden = false
        } else {
            dropzoneImagePhoto.isHidden = false
            dropzoneImageDefault.isHidden = true
            
            if isShowLabel {
                containerLabel.isHidden = false
                dropzoneLabel.isHidden = false
            } else {
                containerLabel.isHidden = true
                dropzoneLabel.isHidden = true
            }
        }
    }
    
    public func setDefault() {
        isDefault = true
        containerDropzone.backgroundColor = colorBg
        dropzoneImageDefault.image = defaultPhoto
        setupContent()
    }
    
    public func setError() {
        isDefault = true
        containerDropzone.backgroundColor = colorBgError
        dropzoneImageDefault.image = errorPhoto
        setupContent()
    }
    
    public func setPhoto(image: UIImage) {
        isDefault = false
        dropzoneImagePhoto.image = image
        setupContent()
    }
}
