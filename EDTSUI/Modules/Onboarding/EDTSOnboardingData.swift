//
//  EDTSOnboardingData.swift
//  EDTSUI
//
//  Created by Victor Toya on 27/09/22.
//

import UIKit

public struct EDTSOnboardingData {
    var image: String
    var title: String
    var message: String
    
    public init(image: String, title: String, message: String) {
        self.image = image
        self.title = title
        self.message = message
    }
}

public enum EDTSContentAlignment: Int {
    case left = 0
    case center = 1
    case right = 2
}
