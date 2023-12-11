//
//  EDTSMenuTrayCell.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 07/07/23.
//

import UIKit

public class EDTSMenuTrayCell: UITableViewCell {
    @IBOutlet public weak var indicatorImage: UIImageView!
    @IBOutlet public weak var label: UILabel!

    static let cellIdentifier = "EDTSMenuTrayCell"
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    public func update(with item: EDTSMenuTray.Menu, isSelected: Bool, withIndicator: Bool = false) {
        self.indicatorImage.isHidden = !withIndicator
        self.indicatorImage.image = UIImage(named: isSelected ? "ic_radio_button_on" : "ic_radio_button_off", in: Bundle(for: EDTSMenuTrayCell.self), compatibleWith: nil)
        self.label.text = item.label
    }
}
