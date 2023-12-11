//
//  EDTSInformationView.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 11/05/23.
//

import UIKit

@IBDesignable
public class EDTSInformationView: UIView {
    @IBOutlet weak var view: EDTSUIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    public var parentVC: UIViewController?
    
    /// Use this closure to perform some actions on the tray, such as styling, etc.
    public var onShowTray: ((EDTSInformationViewTray) -> Void)?
    
    @IBInspectable var bgColor: UIColor? = nil {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable var textColor: UIColor? = nil {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable var moreLabelColor: UIColor? = nil {
        didSet {
            self.updateUI()
        }
    }

    @IBInspectable
    public var iconImage: UIImage? = nil {
        didSet {
            if let iconImage {
                self.icon.image = iconImage
            }
        }
    }
    
    @IBInspectable
    public var numberOfLines: Int = 2 {
        didSet {
            self.updateUI()
        }
    }
    
    @IBInspectable
    public var text: String? = nil {
        didSet {
            self.label.setTextFromHTML(text, fontSize: 12, color: .black.withAlphaComponent(0.5))
            self.updateUI()
        }
    }
    
    @IBInspectable
    public var trayTitle: String? = "Selengkapnya"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        let contentView = Bundle(for: EDTSInformationView.self).loadNibNamed("EDTSInformationView", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
                
        self.updateUI()
    }
    
    private func updateUI() {
        // Background color
        if let bgColor {
            self.view.backgroundColor = bgColor
        }
        
        // Text Label
        self.label.numberOfLines = self.numberOfLines
        if let textColor {
            self.label.textColor = textColor
        }

        // "Selengkapnya" Label
        let lines = EDTSTextHelper.getTextLines(label: self.label)
        self.moreLabel.isHidden = self.numberOfLines == 0 || lines <= self.numberOfLines
        
        if let moreLabelColor {
            self.moreLabel.textColor = moreLabelColor
        }
    }
    
    @IBAction func didTapMoreLabel(_ sender: Any) {
        let tray = EDTSInformationViewTray()
       
        self.parentVC?.present(tray, animated: false) { [unowned self] in
            tray.titleLabel.text = self.trayTitle
            tray.contentLabel.setTextFromHTML(self.text)
            self.onShowTray?(tray)
        }
    }
}

