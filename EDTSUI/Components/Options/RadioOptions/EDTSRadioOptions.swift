//
//  EDTSRadioOptions.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 26/05/23.
//

import UIKit

public class EDTSRadioOptions: UIView {
    
    @IBInspectable
    public var radioActiveImage: UIImage? = nil
    
    @IBInspectable
    public var radioInactiveImage: UIImage? = nil
    
    public var options: [Option] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    public var selected: Option? = nil {
        didSet {
            self.didSetSelected()
        }
    }
    public var fullWidth: Bool = false {
        didSet {
            self.collectionView.reloadData()
        }
    }
    public var onChange: ((Option?) -> Void)?
    
    /// Use this closure to perform some actions on the cell, such as styling, etc.
    public var onSetupCell: ((EDTSRadioOptionsCell) -> Void)?

    
    @IBOutlet weak var collectionView: EDTSFittedCollectionView!
    
        
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        let contentView = Bundle(for: EDTSRadioOptions.self).loadNibNamed("EDTSRadioOptions", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        // Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: EDTSRadioOptionsCell.cellIdentifier, bundle: Bundle(for: EDTSRadioOptions.self)), forCellWithReuseIdentifier: EDTSRadioOptionsCell.cellIdentifier)
    }

    
    private func didSetSelected() {
        self.collectionView.reloadData()
    }
}


extension EDTSRadioOptions: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EDTSRadioOptionsCell.cellIdentifier, for: indexPath) as! EDTSRadioOptionsCell
        
        let item = options[indexPath.row]
        cell.radioActiveImage = radioActiveImage
        cell.radioInactiveImage = radioInactiveImage
        cell.update(with: item, isSelected: item.value == selected?.value)
        cell.separator.isHidden = !fullWidth
        
        self.onSetupCell?(cell)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = options[indexPath.row]
        self.selected = item
        self.onChange?(self.selected)
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Dynamic column width Layout
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let width = fullWidth
        ? collectionView.frame.width
        : (collectionView.frame.width / 3) - layout.minimumInteritemSpacing
        let item = options[indexPath.row]
        return CGSize(width: width, height: item.secondaryLabel != nil ? 70 : fullWidth ? 50 : 28)
    }
}
