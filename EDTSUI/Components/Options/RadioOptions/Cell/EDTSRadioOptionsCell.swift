//
//  EDTSRadioOptionsCell.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 26/05/23.
//

import UIKit

public class EDTSRadioOptionsCell: UICollectionViewCell {
    @IBOutlet public weak var radioIcon: UIImageView!
    @IBOutlet public weak var icon: UIImageView!
    @IBOutlet public weak var label: UILabel!
    @IBOutlet public weak var secondaryLabel: UILabel!
    @IBOutlet public weak var separator: UIView!
    
    static let cellIdentifier = "EDTSRadioOptionsCell"
    
    public var radioActiveImage: UIImage? = nil
    public var radioInactiveImage: UIImage? = nil

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func update(with item: Option, isSelected: Bool = false) {
        // Icon
        if isSelected {
            self.radioIcon.image = radioActiveImage ?? UIImage(named: "ic_radio_button_on", in: Bundle(for: EDTSRadioOptionsCell.self), compatibleWith: nil)
        } else {
            self.radioIcon.image = radioInactiveImage ?? UIImage(named: "ic_radio_button_off", in: Bundle(for: EDTSRadioOptionsCell.self), compatibleWith: nil)
        }
        
        self.label.text = item.label
        
        if let icon = item.icon {
            self.icon.image = UIImage(named: icon)
        }
        self.icon.isHidden = item.icon == nil
        
        self.secondaryLabel.isHidden = item.secondaryLabel == nil
        self.secondaryLabel.text = item.secondaryLabel
    }
}
