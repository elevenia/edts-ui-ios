//
//  EDTSFittedTableView.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 17/05/23.
//

import UIKit

/// You can use this view if you want to use `UITableView` inside `UIScrollView` with dynamic height.
public class EDTSFittedTableView: UITableView {
    public override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    public override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
