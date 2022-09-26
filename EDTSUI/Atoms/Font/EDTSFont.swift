//
//  EDTSFont.swift
//  EDTSUI
//
//  Created by Victor Toya on 13/09/22.
//

import UIKit

class EDTSFont: NSObject {
    
    override public init() {
        super.init()
    }
    
    open class var displayD1: UIFont {
        return UIFont.boldSystemFont(ofSize: 28)
    }
    
    open class var displayD2: UIFont {
        return UIFont.boldSystemFont(ofSize: 24)
    }
    
    open class var headingH1: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    open class var headingH2: UIFont {
        return UIFont.boldSystemFont(ofSize: 14)
    }
    
    open class var headingH3: UIFont {
        return UIFont.boldSystemFont(ofSize: 12)
    }
    
    open class var headingH4: UIFont {
        return UIFont.boldSystemFont(ofSize: 10)
    }
    
    open class var bodyB1: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    open class var bodyB2: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    open class var bodyB3: UIFont {
        return UIFont.systemFont(ofSize: 10)
    }
    
    open class var paragraphP1: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    open class var paragraphP2: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    open class var textlink: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    open class var alert: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
}
