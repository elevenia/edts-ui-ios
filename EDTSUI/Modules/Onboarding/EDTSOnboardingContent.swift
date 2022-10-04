//
//  EDTSOnboardingContent.swift
//  EDTSUI
//
//  Created by Victor Toya on 27/09/22.
//

import UIKit

class EDTSOnboardingContent: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    
    var data: EDTSOnboardingData?
    
    var titleFont = "--"
    var titleSize = 24
    var titleColor = UIColor.black
    var messageFont = "--"
    var messageSize = 14
    var messageColor = UIColor.lightGray
    
    var contentAlignment = EDTSContentAlignment.left
    
    public init(frame: CGRect, data: EDTSOnboardingData, titleFont: String, titleSize: Int, titleColor: UIColor, messageFont: String, messageSize: Int, messageColor: UIColor, contentAlignment: EDTSContentAlignment) {
        super.init(frame: frame)
        setupNib()
        
        self.data = data
        self.titleFont = titleFont
        self.titleSize = titleSize
        self.titleColor = titleColor
        self.messageFont = messageFont
        self.messageSize = messageSize
        self.messageColor = messageColor
        self.contentAlignment = contentAlignment
        
        setupUI()
        loadData()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
    }
    
    private func setupNib() {
        let frameworkBundle = Bundle(for: EDTSOnboardingContent.self)
        frameworkBundle.loadNibNamed("EDTSOnboardingContent", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupUI() {
        title.textColor = titleColor
        title.font = UIFont(name: titleFont, size: CGFloat(titleSize)) ?? UIFont.boldSystemFont(ofSize: CGFloat(titleSize))
        
        message.textColor = messageColor
        message.font = UIFont(name: messageFont, size: CGFloat(messageSize)) ?? UIFont.systemFont(ofSize: CGFloat(messageSize))
        
        switch contentAlignment {
        case .left:
            title.textAlignment = .left
            message.textAlignment = .left
        case .center:
            title.textAlignment = .center
            message.textAlignment = .center
        case .right:
            title.textAlignment = .right
            message.textAlignment = .right
        }
    }
    
    private func loadData() {
        if data != nil {
            title.text = data?.title
            message.text = data?.description
            image.image = UIImage(named: data?.image ?? "")
        }
    }
}
