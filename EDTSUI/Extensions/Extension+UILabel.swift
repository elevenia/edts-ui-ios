//
//  Extension+UILabel.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//


import UIKit

extension UILabel {
    
    func setTextFromHTML(
        _ html: String?,
        fontSize: CGFloat = 14,
        color: UIColor = .black
    ) {
        guard let html else {
            self.text = ""
            return
        }
        
        let encodedData = html.data(using: .utf8)!
        let attributedOptions : [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue,
        ]
        let attributedString = try? NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)

        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString!)
        mutableAttributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: fontSize), range: NSRange(location: 0, length: attributedString!.length))
        mutableAttributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: attributedString!.length))
        
        self.attributedText = mutableAttributedString.trimmed()
    }
    
}


