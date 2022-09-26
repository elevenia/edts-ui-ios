//
//  EDTSAlertModel.swift
//  EDTSCode
//
//  Created by Victor Toya on 24/03/22.
//

import UIKit

public enum EDTSPopUpType {
    case oneAction
    case twoAction
    case leftRightAction
}

public enum EDTSPopUpAlign {
    case center
    case left
    case right
}

public struct EDTSPopUpStyle {
    var type = EDTSPopUpType.oneAction
    var align = EDTSPopUpAlign.left
    var image: UIImage?
    var title: String?
    var message: String?
    var firstTitle: String?
    var secondTitle: String?
    var leftTitle: String?
    var rightTitle: String?
    
    public init(type: EDTSPopUpType, align: EDTSPopUpAlign, image: UIImage?, title: String?, message: String?, firstTitle: String?, secondTitle: String?, leftTitle: String?, rightTitle: String?) {
        self.type = type
        self.align = align
        self.image = image
        self.title = title
        self.message = message
        self.firstTitle = firstTitle
        self.secondTitle = secondTitle
        self.leftTitle = leftTitle
        self.rightTitle = rightTitle
    }
}
