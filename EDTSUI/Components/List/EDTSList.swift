//
//  EDTSList.swift
//  EDTSUI
//
//  Created by Kevin Hardianto on 01/12/22.
//

import UIKit

@IBDesignable public class EDTSList: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak public var containerList: UIView!
    @IBOutlet weak public var listLabel: UILabel!
    @IBOutlet weak public var listIcon: UIImageView!
    @IBOutlet weak public var listDetail: UILabel!
    @IBOutlet weak public var listSwitch: UISwitch!
    @IBOutlet weak public var listButton: UIButton!
    @IBOutlet weak public var listSeparator: UIView!
    
    @IBOutlet weak var listIconWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak var listIconTrailingAnchor: NSLayoutConstraint!
    
    @IBInspectable var label: String {
        get {
            return self.listLabel.text ?? ""
        }
        set {
            self.listLabel.text = newValue
        }
    }
    
    @IBInspectable var icon: UIImage {
        get {
            return self.listIcon.image ?? UIImage()
        }
        set {
            self.listIcon.image = newValue
        }
    }
    
    @IBInspectable var detail: String {
        get {
            return self.listDetail.text ?? ""
        }
        set {
            self.listDetail.text = newValue
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
    
    @IBInspectable var showDetail: Bool {
        get {
            return isShowDetail
        }
        set {
            isShowDetail = newValue
            setupContent()
        }
    }
    
    @IBInspectable var showSwitch: Bool {
        get {
            return isShowSwitch
        }
        set {
            isShowSwitch = newValue
            setupContent()
        }
    }
    
    @IBInspectable var showSeparator: Bool {
        get {
            return isShowSeparator
        }
        set {
            isShowSeparator = newValue
            setupContent()
        }
    }
    
    @IBInspectable var separatorColor: UIColor {
        get {
            return listSeparatorColor
        }
        set {
            listSeparatorColor = newValue
            setupView()
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
    
    @IBInspectable var detailFontName: String {
        get {
            return detailName
        }
        set {
            detailName = newValue
            setupView()
        }
    }

    @IBInspectable var detailFontSize: Int {
        get {
            return detailSize
        }
        set {
            detailSize = newValue
            setupView()
        }
    }
    
    @IBInspectable var detailFontColor: UIColor {
        get {
            return detailColor
        }
        set {
            detailColor = newValue
            setupView()
        }
    }
    
    var isShowDetail = false
    var isShowIcon = false
    var isShowSwitch = false
    var isShowSeparator = false
    
    var listSeparatorColor = UIColor(red: 220.0/255.0, green: 222.0/255.0, blue: 227.0/255.0, alpha: 1.0)
    var colorBg = UIColor.white
    
    var labelName = "--"
    var labelSize = 14
    var labelColor = UIColor(red: 21.0/255.0, green: 24.0/255.0, blue: 35.0/255.0, alpha: 1.0)
    
    var detailName = "--"
    var detailSize = 14
    var detailColor = UIColor(red: 112.0/255.0, green: 114.0/255.0, blue: 125.0/255.0, alpha: 1.0)
    
    var iconTintColor = UIColor(red: 112.0/255.0, green: 114.0/255.0, blue: 125.0/255.0, alpha: 1.0)
    
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
        let frameworkBundle = Bundle(for: EDTSList.self)
        frameworkBundle.loadNibNamed("EDTSList", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupView() {
        containerList.layer.masksToBounds = true
        containerList.layer.backgroundColor = colorBg.cgColor
        
        listLabel.textColor = labelColor
        listLabel.font = UIFont(name: labelName, size: CGFloat(labelSize)) ?? UIFont.systemFont(ofSize: CGFloat(labelSize))
        
        listDetail.textColor = detailColor
        listDetail.font = UIFont(name: detailName, size: CGFloat(detailSize)) ?? UIFont.systemFont(ofSize: CGFloat(detailSize))
        
        listIcon.tintColor = iconTintColor
        
        listSeparator.backgroundColor = listSeparatorColor
    }
    
    private func setupContent() {
        if isShowSwitch {
            listSwitch.isHidden = false
            listIcon.isHidden = true
            listDetail.isHidden = true
            listButton.isHidden = true
        } else {
            listSwitch.isHidden = true
            listButton.isHidden = false
            
            if isShowIcon {
                listIcon.isHidden = false
                listIconWidthAnchor.constant = 16
                listIconTrailingAnchor.constant = 16
            } else {
                listIcon.isHidden = true
                listIconWidthAnchor.constant = 0
                listIconTrailingAnchor.constant = 0
            }
            
            if isShowDetail {
                listDetail.isHidden = false
            } else {
                listDetail.isHidden = true
            }
        }
        
        if isShowSeparator {
            listSeparator.isHidden = false
        } else {
            listSeparator.isHidden = true
        }
    }
}
