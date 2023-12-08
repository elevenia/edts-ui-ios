//
//  Extension+NSAttributedString.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//

import UIKit

extension NSAttributedString {
    
    func trimmed() -> NSAttributedString {
        let nonNewlines = CharacterSet.whitespacesAndNewlines.inverted

        let startRange = string.rangeOfCharacter(from: nonNewlines)
        let endRange = string.rangeOfCharacter(from: nonNewlines, options: .backwards)
        
        guard let startLocation = startRange?.lowerBound, let endLocation = endRange?.lowerBound else {
            return self
        }

        let range = NSRange(startLocation...endLocation, in: string)
        return attributedSubstring(from: range)
    }
    
}
