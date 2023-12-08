//
//  Option.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//

import Foundation


public struct Option: Equatable {
    /// unique identifier of the option
    public var id: Int?
    
    /// icon that will show in the dropdown
    public var icon: String?
    
    /// label that will show in the dropdown
    public var label: String
    
    /// secondary label that will show in the dropdown
    public var secondaryLabel: String?
    
    /// unique value of the option
    public var value: String
    
    public init(id: Int? = nil, icon: String? = nil, label: String, secondaryLabel: String? = nil, value: String) {
        self.id = id
        self.icon = icon
        self.label = label
        self.secondaryLabel = secondaryLabel
        self.value = value
    }
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.label == rhs.label && lhs.value == rhs.value
    }
}
