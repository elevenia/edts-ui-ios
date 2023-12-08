//
//  EDTSInformationViewTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 09/05/23.
//


import UIKit

public class EDTSInformationViewTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet public weak var containerTray: UIView!
    @IBOutlet public weak var containerTrayBottomAnchor: NSLayoutConstraint!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var contentLabel: UITextView!
    
    public override init() {
        super.init(nibName: "EDTSInformationViewTray", bundle: Bundle(for: EDTSInformationViewTray.self))
    }
    
    public required init?(coder: NSCoder) {
        super.init(nibName: "EDTSInformationViewTray", bundle: Bundle(for: EDTSInformationViewTray.self))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self                
    }
        
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

