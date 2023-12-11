//
//  EDTSAlertTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 18/07/23.
//

import UIKit


public class EDTSAlertTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet public weak var containerTray: UIView!
    @IBOutlet public weak var containerTrayBottomAnchor: NSLayoutConstraint!

    @IBOutlet public weak var image: UIImageView!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var descriptionLabel: UILabel!
    @IBOutlet public weak var button: UIButton!
    @IBOutlet public weak var headerView: UIView!
    @IBOutlet public weak var headerTitleLabel: UILabel!
    
    public var data: EDTSAlertTrayData?
    
    
    public override init() {
        super.init(nibName: "EDTSAlertTray", bundle: Bundle(for: EDTSAlertTray.self))
    }
    
    public required init?(coder: NSCoder) {
        super.init(nibName: "EDTSAlertTray", bundle: Bundle(for: EDTSAlertTray.self))
    }
 
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self
        
        guard let data else { return }
        
        self.headerView.isHidden = data.headerTitle.isEmpty
        self.headerTitleLabel.text = data.headerTitle
        self.image.image = UIImage(named: data.image)
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
        self.button.setTitle(data.buttonText, for: .normal)
        if let buttonColor = data.buttonColor {
            self.button.backgroundColor = buttonColor
        }
    }
 
    @IBAction func didTapButton(_ sender: Any) {
        self.dismiss(animated: true)
        self.data?.onTapButton?()
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

public struct EDTSAlertTrayData {
    public var headerTitle: String
    public var image: String
    public var title: String
    public var description: String
    public var buttonText: String
    public var buttonColor: UIColor?
    public var onTapButton: (() -> Void)?
    
    public init(headerTitle: String = "", image: String, title: String, description: String, buttonText: String = "Oke", buttonColor: UIColor? = nil, onTapButton: (() -> Void)? = nil) {
        self.headerTitle = headerTitle
        self.image = image
        self.title = title
        self.description = description
        self.buttonText = buttonText
        self.buttonColor = buttonColor
        self.onTapButton = onTapButton
    }
}
