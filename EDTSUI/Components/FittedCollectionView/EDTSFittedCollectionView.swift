//
//  EDTSFittedCollectionView.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 17/05/23.
//

import UIKit

/// You can use this view if you want to use `UICollectionView` inside `UIScrollView` with dynamic height.
public class EDTSFittedCollectionView: UICollectionView {
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        isScrollEnabled = false
    }

    public override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    public override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }

    public override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
