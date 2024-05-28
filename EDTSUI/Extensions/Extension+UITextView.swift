//
//  Extension+UITextView.swift
//  EDTSUI
//
//  Created by M Alfin Syahruddin on 08/12/23.
//


import UIKit


extension UITextView {
    
    func setTextFromHTML(
        _ html: String?,
        fontSize: CGFloat = 14,
        color: UIColor = .black
    ) {
        guard let html else {
            self.text = ""
            return
        }
        
        let modifiedHTML = String(format:"<div style=\"font-family: 'Inter-Regular', '-apple-system', 'HelveticaNeue'; font-size: \(self.font!.pointSize)\">%@</div>", html)

        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue,
        ]
        let attributedString = try? NSAttributedString(data: modifiedHTML.data(using: .unicode, allowLossyConversion: true)!, options: attributedOptions, documentAttributes: nil)
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString!)
            
        self.attributedText = mutableAttributedString
    }
    
}
