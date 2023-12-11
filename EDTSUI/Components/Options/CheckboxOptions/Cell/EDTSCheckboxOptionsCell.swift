//
//  EDTSCheckboxOptionsCell.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 26/05/23.
//

import UIKit

public class EDTSCheckboxOptionsCell: UICollectionViewCell {
    @IBOutlet public weak var checkboxIcon: UIImageView!
    @IBOutlet public weak var icon: UIImageView!
    @IBOutlet public weak var label: UILabel!
    @IBOutlet public weak var secondaryLabel: UILabel!
    @IBOutlet public weak var separator: UIView!
    
    public static let cellIdentifier = "EDTSCheckboxOptionsCell"
    
    public var checkboxActiveImage: UIImage? = nil
    public var checkboxInactiveImage: UIImage? = nil
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func update(with item: Option, isSelected: Bool = false) {
        // Icon
        if isSelected {
            self.checkboxIcon.image = checkboxActiveImage ?? UIImage(named: "ic_checkbox_checked", in: Bundle(for: EDTSCheckboxOptionsCell.self), compatibleWith: nil)
        } else {
            self.checkboxIcon.image = checkboxInactiveImage ?? UIImage(named: "ic_checkbox_uncheck", in: Bundle(for: EDTSCheckboxOptionsCell.self), compatibleWith: nil)
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
