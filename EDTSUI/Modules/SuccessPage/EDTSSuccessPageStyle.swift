//
//  EDTSSuccessPageStyle.swift
//  EDTSUI
//
//  Created by Victor Toya on 17/11/22.
//

import UIKit

public struct EDTSSuccessPageStyle {
    var title: String?
    var message: String?
    var image: UIView?
    var imageSize: CGFloat?
    var redirect: UIViewController?
    var firstButton: UIButton?
    var secondButton: UIButton?
    var fontTitle: UIFont?
    var fontMessage: UIFont?
    var colorTitle: UIColor?
    var colorMessage: UIColor?
    var interval: Int?
    var bottomInfo: EDTSSuccessPageBottomInfo?
    
    public init(title: String?, message: String?, image: UIView?, imageSize: CGFloat?, redirect: UIViewController?, firstButton: UIButton?, secondButton: UIButton?, fontTitle: UIFont?, fontMessage: UIFont?, colorTitle: UIColor?, colorMessage: UIColor?, interval: Int?, bottomInfo: EDTSSuccessPageBottomInfo?) {
        self.title = title
        self.message = message
        self.image = image
        self.imageSize = imageSize
        self.redirect = redirect
        self.firstButton = firstButton
        self.secondButton = secondButton
        self.fontTitle = fontTitle
        self.fontMessage = fontMessage
        self.colorTitle = colorTitle
        self.colorMessage = colorMessage
        self.interval = interval
        self.bottomInfo = bottomInfo
    }
}

public struct EDTSSuccessPageBottomInfo {
    var message: String?
    var textFont: UIFont?
    var textColor: UIColor?
    var alignment: NSTextAlignment?
    var background: UIColor?
    var cornerRadius: CGFloat?
    var borderWidth: CGFloat?
    var borderColor: UIColor?
    
    public init(message: String?, textFont: UIFont?, textColor: UIColor?, alignment: NSTextAlignment?, background: UIColor?, cornerRadius: CGFloat?, borderWidth: CGFloat?, borderColor: UIColor?) {
        self.message = message
        self.textFont = textFont
        self.textColor = textColor
        self.alignment = alignment
        self.background = background
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}
