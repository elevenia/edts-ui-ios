//
//  EDTSAlert.swift
//  EDTSCode
//
//  Created by Victor Toya on 24/03/22.
//

import UIKit

public protocol EDTSPopUpDelegate: AnyObject {
    func onActionFirstTapped()
    func onActionSecondTapped()
    func onActionLeftTapped()
    func onActionRightTapped()
}

public class EDTSPopUp: UIViewController {
    @IBOutlet public weak var viewAlert: UIView!
    @IBOutlet public weak var viewAlertHeightAnchor: NSLayoutConstraint!
    
    @IBOutlet public weak var imgAlertImage: UIImageView!
    @IBOutlet public weak var imgAlertImageHeightAnchor: NSLayoutConstraint!
    @IBOutlet public weak var imgAlertImageTopAnchor: NSLayoutConstraint!
    
    @IBOutlet public weak var lblAlertTitle: UILabel!
    @IBOutlet public weak var lblAlertTitleHeightAnchor: NSLayoutConstraint!
    @IBOutlet public weak var lblAlertTitleBottomAnchor: NSLayoutConstraint!
    
    @IBOutlet public weak var lblAlertMessage: UILabel!
    
    @IBOutlet public weak var btnLeftRightContainer: UIStackView!
    @IBOutlet public weak var btnLeft: UIButton!
    @IBOutlet public weak var btnRight: UIButton!
    
    @IBOutlet public weak var btnFirst: UIButton!
    @IBOutlet public weak var btnSecond: UIButton!
    
    public var style: EDTSPopUpStyle?
    public weak var delegate: EDTSPopUpDelegate?
    
    public init() {
        super.init(nibName: "EDTSPopUp", bundle: Bundle(for: EDTSPopUp.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "EDTSPopUp", bundle: Bundle(for: EDTSPopUp.self))
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if style != nil {
            lblAlertTitle.text = style?.title
            lblAlertMessage.text = style?.message
            
            switch style!.align {
            case .center:
                lblAlertTitle.textAlignment = .center
                lblAlertMessage.textAlignment = .center
            case .left:
                lblAlertTitle.textAlignment = .left
                lblAlertMessage.textAlignment = .left
            case .right:
                lblAlertTitle.textAlignment = .right
                lblAlertMessage.textAlignment = .right
            }
            
            switch style!.type {
            case .oneAction:
                btnLeftRightContainer.isHidden = true
                btnSecond.isHidden = true
    
                btnFirst.setTitle(style?.firstTitle, for: .normal)
        
                setupAlertHeightAnchor()
            case .twoAction:
                btnLeftRightContainer.isHidden = true
                
                btnFirst.setTitle(style?.firstTitle, for: .normal)
                btnSecond.setTitle(style?.secondTitle, for: .normal)
                
                setupAlertHeightAnchor()
            case .leftRightAction:
                btnFirst.isHidden = true
                btnSecond.isHidden = true
                
                btnLeft.setTitle(style?.leftTitle, for: .normal)
                btnRight.setTitle(style?.rightTitle, for: .normal)
                
                setupAlertHeightAnchor()
            }
            
            if style?.title == nil {
                lblAlertTitleHeightAnchor.constant = 0
                lblAlertTitleBottomAnchor.constant = 0
            }
            
            if style?.image == nil {
                imgAlertImageTopAnchor.constant = 0
                imgAlertImageHeightAnchor.constant = 0
            } else {
                imgAlertImage.image = style?.image
            }
        }
    }
    
    @objc func setupAlertHeightAnchor() {
        switch style!.type {
        case .oneAction:
            viewAlert.removeConstraint(viewAlertHeightAnchor)
            viewAlert.bottomAnchor.constraint(equalTo: btnFirst.bottomAnchor, constant: 20).isActive = true
        case .twoAction:
            viewAlert.removeConstraint(viewAlertHeightAnchor)
            viewAlert.bottomAnchor.constraint(equalTo: btnSecond.bottomAnchor, constant: 20).isActive = true
        case .leftRightAction:
            viewAlert.removeConstraint(viewAlertHeightAnchor)
            viewAlert.bottomAnchor.constraint(equalTo: btnLeft.bottomAnchor, constant: 20).isActive = true
        }
    }
    
    @IBAction func btnLeftTapped(_ sender: Any) {
        self.delegate?.onActionLeftTapped()
    }
    
    @IBAction func btnRightTapped(_ sender: Any) {
        self.delegate?.onActionRightTapped()
    }
    
    @IBAction func btnFirstTapped(_ sender: Any) {
        self.delegate?.onActionFirstTapped()
    }
    
    @IBAction func btnSecondTapped(_ sender: Any) {
        self.delegate?.onActionSecondTapped()
    }
}
