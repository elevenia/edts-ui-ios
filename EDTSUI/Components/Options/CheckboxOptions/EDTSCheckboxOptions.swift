//
//  EDTSCheckboxOptions.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 26/05/23.
//

import UIKit


public class EDTSCheckboxOptions: UIView {
    
    @IBInspectable
    public var checkboxActiveImage: UIImage? = nil
    
    @IBInspectable
    public var checkboxInactiveImage: UIImage? = nil
    
    public var options: [EDTSOption] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    public var selected: [EDTSOption] = [] {
        didSet {
            self.didSetSelected()
        }
    }
    public var fullWidth: Bool = false {
        didSet {
            self.collectionView.reloadData()
        }
    }
    public var onChange: (([EDTSOption]) -> Void)?
    
    /// Use this closure to perform some actions on the cell, such as styling, etc.
    public var onSetupCell: ((EDTSCheckboxOptionsCell) -> Void)?

    
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
        let contentView = Bundle(for: EDTSCheckboxOptions.self).loadNibNamed("EDTSCheckboxOptions", owner: self, options: nil)![0] as! UIView
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
        // Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: EDTSCheckboxOptionsCell.cellIdentifier, bundle: Bundle(for: EDTSCheckboxOptions.self)), forCellWithReuseIdentifier: EDTSCheckboxOptionsCell.cellIdentifier)
    }

    
    private func didSetSelected() {
        self.collectionView.reloadData()
    }

}


extension EDTSCheckboxOptions: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EDTSCheckboxOptionsCell.cellIdentifier, for: indexPath) as! EDTSCheckboxOptionsCell
        
        let item = options[indexPath.row]
        cell.checkboxActiveImage = checkboxActiveImage
        cell.checkboxInactiveImage = checkboxInactiveImage
        cell.update(with: item, isSelected: selected.contains(item))
        cell.separator.isHidden = !fullWidth
        
        self.onSetupCell?(cell)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = options[indexPath.row]
        if self.selected.contains(item) {
            self.selected = self.selected.filter { $0.value != item.value }
            self.onChange?(selected)
        } else {
            self.selected.append(item)
            self.onChange?(selected)
        }
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
