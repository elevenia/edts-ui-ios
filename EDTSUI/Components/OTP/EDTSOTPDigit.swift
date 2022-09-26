//
//  EDTSOTPDigit.swift
//  EDTSUI
//
//  Created by Victor Toya on 23/09/22.
//

import UIKit

protocol EDTSOTPDigitDelegate {
    func textFieldDidDeleteBackward(_ textfield: UITextField)
}

class EDTSOTPDigit: UITextField {
    var digitDelegate: EDTSOTPDigitDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        self.digitDelegate?.textFieldDidDeleteBackward(self)
    }
}
