//
//  EDTSQRCodeView.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 11/05/23.
//

import UIKit

public class EDTSQRCodeView: UIView {
    @IBOutlet public weak var image: UIImageView!
        
    @IBInspectable
    public var textKey: String = "Kode"
    
    @IBInspectable
    public var text: String = "" {
        didSet {
            self.image.image = QRCodeHelper.generateQRCode(text: text)
        }
    }
    
    public var parentVC: UIViewController?

    // Use this closure to perform some actions on the tray, such as styling, etc.
    public var onShowTray: ((EDTSQRCodeViewTray) -> Void)?
    
    @IBInspectable
    var showTray: Bool = true
   
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        let contentView = Bundle(for: EDTSQRCodeView.self).loadNibNamed("EDTSQRCodeView", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        self.image.layer.magnificationFilter = CALayerContentsFilter.nearest
        self.image.image = QRCodeHelper.generateQRCode(text: text)
    }
    
    
    @IBAction func didTapImage(_ sender: Any) {
        guard showTray else { return }
        
        let tray = EDTSQRCodeViewTray()
        tray.qrCodeView = self
        self.parentVC?.present(tray, animated: false) { [unowned self] in
            self.onShowTray?(tray)
        }
    }
}
