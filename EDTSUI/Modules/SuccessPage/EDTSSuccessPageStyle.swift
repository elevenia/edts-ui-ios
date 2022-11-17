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
    
    public init(title: String?, message: String?, image: UIView?, imageSize: CGFloat?, redirect: UIViewController?, firstButton: UIButton?, secondButton: UIButton?, fontTitle: UIFont?, fontMessage: UIFont?, colorTitle: UIColor?, colorMessage: UIColor?, interval: Int?) {
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
    }
}
