//
//  Text.swift
//  EDTSCode
//
//  Created by Kevin Hardianto on 15/03/23.
//

import UIKit

public class EDTSTextHelper: NSObject {
    public class func getTextLines(label: UILabel) -> Int {
        guard let text = label.text else {
          return 0
        }
        let rect = CGSize(width: label.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        label.layoutIfNeeded()
        let labelSize = text.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: label.font as Any], context: nil)
        return Int(ceil(CGFloat(labelSize.height) / label.font.lineHeight))
    }
    
    public class func getTextSize(text: String, view: CGFloat, font: UIFont, numberOfLines: Int) -> CGSize {
        let label = UILabel()
        label.text = text
        label.numberOfLines = numberOfLines
        let size = label.sizeThatFits(CGSize(width: view, height: .greatestFiniteMagnitude))
        return size
    }
}
