//
//  EDTSQRCodeViewTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 09/05/23.
//


import UIKit

public class EDTSQRCodeViewTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet public weak var containerTray: UIView!
    @IBOutlet public weak var containerTrayBottomAnchor: NSLayoutConstraint!

    @IBOutlet public weak var image: UIImageView!
    @IBOutlet public weak var codeLabel: UILabel!
    
    public weak var qrCodeView: EDTSQRCodeView!
    
    public override init() {
        super.init(nibName: "EDTSQRCodeViewTray", bundle: Bundle(for: EDTSQRCodeViewTray.self))
    }
    
    public required init?(coder: NSCoder) {
        super.init(nibName: "EDTSQRCodeViewTray", bundle: Bundle(for: EDTSQRCodeViewTray.self))
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self

        setupUI()
    }
    
    private func setupUI() {
        self.image.layer.magnificationFilter = CALayerContentsFilter.nearest
        self.image.image = QRCodeHelper.generateQRCode(text: qrCodeView.text)
        self.codeLabel.text = "\(qrCodeView.textKey): \(qrCodeView.text)"
    }
        
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

