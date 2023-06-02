//
//  EDTSToaster.swift
//  EDTSUI
//
//  Created by Victor Toya on 29/09/22.
//

import UIKit

public class EDTSToaster: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var iconWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak var iconTrailingAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    
    public init(frame: CGRect, message: String?, icon: UIImage?, font: UIFont?, background: UIColor?) {
        super.init(frame: frame)
        setupNib()
        
        self.label.text = message
        
        if icon != nil {
            self.icon.image = icon
            self.icon.isHidden = false
            self.iconWidthAnchor.constant = 16
            self.iconTrailingAnchor.constant = 8
        } else {
            self.icon.isHidden = true
            self.iconWidthAnchor.constant = 0
            self.iconTrailingAnchor.constant = 0
        }

        if font != nil {
            self.label.font = font
        }
        
        if background != nil {
            self.container.backgroundColor = background
        }
    }
    
    public init(frame: CGRect, attributedText: NSAttributedString?, icon: UIImage?, font: UIFont?, background: UIColor?) {
        super.init(frame: frame)
        setupNib()
        
        if icon != nil {
            self.icon.image = icon
            self.icon.isHidden = false
            self.iconWidthAnchor.constant = 16
            self.iconTrailingAnchor.constant = 8
        } else {
            self.icon.isHidden = true
            self.iconWidthAnchor.constant = 0
            self.iconTrailingAnchor.constant = 0
        }

        if font != nil {
            self.label.font = font
        }
        
        if background != nil {
            self.container.backgroundColor = background
        }
        
        self.label.attributedText = attributedText
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
    }
    
    private func setupNib() {
        let frameworkBundle = Bundle(for: EDTSToaster.self)
        frameworkBundle.loadNibNamed("EDTSToaster", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
