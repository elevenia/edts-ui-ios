//
//  EDTSSuccessPage.swift
//  EDTSUI
//
//  Created by Victor Toya on 17/11/22.
//

import UIKit

public protocol EDTSSuccessPageDelegate {
    func onButtonFirstTapped()
    func onButtonSecondTapped()
}

public class EDTSSuccessPage: UIViewController {

    @IBOutlet weak var imgSuccessPage: UIImageView!
    @IBOutlet weak var imgSuccessPageWidthAnchor: NSLayoutConstraint!
    @IBOutlet weak var imgSuccessPageHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var lblSuccessPageTitle: UILabel!
    @IBOutlet weak var lblSuccessPageMessage: UILabel!
    
    @IBOutlet weak var containerFirstButton: UIView!
    @IBOutlet weak var containerSecondButton: UIView!
    @IBOutlet weak var containerSecondButtonLeadingAnchor: NSLayoutConstraint!
    @IBOutlet weak var containerSecondButtonWidthAnchor: NSLayoutConstraint!
    
    @IBOutlet weak var containerBottomInfo: UIView!
    @IBOutlet weak var lblBottomInfo: UILabel!
    
    public var style: EDTSSuccessPageStyle?
    public var delegate: EDTSSuccessPageDelegate?
    
    public init() {
        super.init(nibName: "EDTSSuccessPage", bundle: Bundle(for: EDTSSuccessPage.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "EDTSSuccessPage", bundle: Bundle(for: EDTSSuccessPage.self))
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        
        if style?.redirect != nil {
            self.perform(#selector(redirectViewController), with: nil, afterDelay: TimeInterval(style?.interval ?? 3))
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    func setupUI() {
        if style?.image != nil {
            imgSuccessPage.addSubview(style!.image!)
            style!.image!.translatesAutoresizingMaskIntoConstraints = false
            style!.image!.topAnchor.constraint(equalTo: imgSuccessPage.topAnchor).isActive = true
            style!.image!.bottomAnchor.constraint(equalTo: imgSuccessPage.bottomAnchor).isActive = true
            style!.image!.leadingAnchor.constraint(equalTo: imgSuccessPage.leadingAnchor).isActive = true
            style!.image!.trailingAnchor.constraint(equalTo: imgSuccessPage.trailingAnchor).isActive = true
        }
        
        if style?.imageSize != nil {
            imgSuccessPageWidthAnchor.constant = style!.imageSize!
            imgSuccessPageHeightAnchor.constant = style!.imageSize!
        }
        
        if style?.firstButton != nil && style?.secondButton != nil {
            containerFirstButton.isHidden = false
            containerFirstButton.isHidden = false
            
            showButtonFirst()
            showButtonSecond()
        } else if style?.firstButton != nil {
            self.view.removeConstraint(containerSecondButtonWidthAnchor)
            
            containerSecondButton.isHidden = false
            containerSecondButton.widthAnchor.constraint(equalToConstant: 0).isActive = true
            containerSecondButtonLeadingAnchor.constant = 0
            
            showButtonFirst()
        }
        
        if style?.fontTitle != nil {
            lblSuccessPageTitle.font = style!.fontTitle!
        }
        
        if style?.colorTitle != nil {
            lblSuccessPageTitle.textColor = style!.colorTitle!
        }
        
        if style?.fontMessage != nil {
            lblSuccessPageMessage.font = style!.fontMessage!
        }
        
        if style?.colorMessage != nil {
            lblSuccessPageMessage.textColor = style!.colorMessage!
        }
        
        if style?.bottomInfo != nil {
            containerBottomInfo.isHidden = false
            containerBottomInfo.backgroundColor = style?.bottomInfo?.background ?? .clear
            containerBottomInfo.layer.cornerRadius = style?.bottomInfo?.cornerRadius ?? 0
            containerBottomInfo.layer.borderWidth = style?.bottomInfo?.borderWidth ?? 0
            containerBottomInfo.layer.borderColor = style?.bottomInfo?.borderColor?.cgColor ?? UIColor.clear.cgColor
            
            lblBottomInfo.text = style?.bottomInfo?.message
            lblBottomInfo.textAlignment = style?.bottomInfo?.alignment ?? .left
            lblBottomInfo.font = style?.bottomInfo?.textFont ?? UIFont.systemFont(ofSize: 14)
            lblBottomInfo.textColor = style?.bottomInfo?.textColor ?? .black
            
            if style?.bottomInfo?.attributes != nil {
                lblBottomInfo.attributedText = style!.bottomInfo!.attributes!
            }
        }
    }
    
    func loadData() {
        lblSuccessPageTitle.text = style?.title
        lblSuccessPageMessage.text = style?.message
    }
    
    func showButtonFirst() {
        if style?.firstButton != nil {
            containerFirstButton.addSubview(style!.firstButton!)
            
            style!.firstButton!.translatesAutoresizingMaskIntoConstraints = false
            style!.firstButton!.topAnchor.constraint(equalTo: containerFirstButton.topAnchor).isActive = true
            style!.firstButton!.bottomAnchor.constraint(equalTo: containerFirstButton.bottomAnchor).isActive = true
            style!.firstButton!.leadingAnchor.constraint(equalTo: containerFirstButton.leadingAnchor).isActive = true
            style!.firstButton!.trailingAnchor.constraint(equalTo: containerFirstButton.trailingAnchor).isActive = true
            
            style!.firstButton!.addTarget(self, action: #selector(onBtnFirstTapped(_:)), for: .touchUpInside)
        }
    }
    
    func showButtonSecond() {
        if style?.secondButton != nil {
            containerSecondButton.addSubview(style!.secondButton!)
            
            style!.secondButton!.translatesAutoresizingMaskIntoConstraints = false
            style!.secondButton!.topAnchor.constraint(equalTo: containerSecondButton.topAnchor).isActive = true
            style!.secondButton!.bottomAnchor.constraint(equalTo: containerSecondButton.bottomAnchor).isActive = true
            style!.secondButton!.leadingAnchor.constraint(equalTo: containerSecondButton.leadingAnchor).isActive = true
            style!.secondButton!.trailingAnchor.constraint(equalTo: containerSecondButton.trailingAnchor).isActive = true
            
            style!.secondButton!.addTarget(self, action: #selector(onBtnSecondTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc func redirectViewController() {
        if style?.redirect != nil {
            self.navigationController?.pushViewController(style!.redirect!, animated: true)
        }
    }
    
    @objc func onBtnFirstTapped(_ sender: Any) {
        self.delegate?.onButtonFirstTapped()
    }
    
    @objc func onBtnSecondTapped(_ sender: Any) {
        self.delegate?.onButtonSecondTapped()
    }
}
