//
//  EDTSOnboardingData.swift
//  EDTSUI
//
//  Created by Victor Toya on 27/09/22.
//

import UIKit

public struct EDTSOnboardingData: Codable {
    var image: String
    var title: String
    var description: String
    
    public init(image: String, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}

public enum EDTSContentAlignment: Int {
    case left = 0
    case center = 1
    case right = 2
}
