//
//  EDTSMenuTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 09/05/23.
//


import UIKit


public class EDTSMenuTray: EDTSBaseTray, EDTSBaseTrayDelegate {
    @IBOutlet weak public var containerTray: UIView!
    @IBOutlet weak public var containerTrayBottomAnchor: NSLayoutConstraint!

    @IBOutlet weak public var titleLabel: UILabel!
    @IBOutlet weak public var tableView: UITableView!
    
    public var withIndicator: Bool = false
    public var menus: [Menu] = []
    public var selectedIndex: Int = 0
    public var onSelect: ((Menu, Int) -> Void)?
    
    /// Use this closure to perform some actions on the cell, such as styling, etc.
    public var onSetupCell: ((EDTSMenuTrayCell) -> Void)?
    
    public override init() {
        super.init(nibName: "EDTSMenuTray", bundle: Bundle(for: EDTSMenuTray.self))
    }
    
    public required init?(coder: NSCoder) {
        super.init(nibName: "EDTSMenuTray", bundle: Bundle(for: EDTSMenuTray.self))
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.trayDelegate = self
        
        titleLabel.text = self.title
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: EDTSMenuTrayCell.cellIdentifier, bundle: Bundle(for: EDTSMenuTray.self)), forCellReuseIdentifier: EDTSMenuTrayCell.cellIdentifier)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
        
    @IBAction func btnCloseTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    public struct Menu {
        public var id: Int
        public var label: String
        
        public init(id: Int = 0, label: String) {
            self.id = id
            self.label = label
        }
    }
}



extension EDTSMenuTray: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EDTSMenuTrayCell.cellIdentifier, for: indexPath) as! EDTSMenuTrayCell
        
        let item = self.menus[indexPath.row]
        cell.update(with: item, isSelected: indexPath.row == selectedIndex, withIndicator: withIndicator)
        
        self.onSetupCell?(cell)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.menus[indexPath.row]

        self.selectedIndex = indexPath.row
        self.dismiss(animated: true)
        self.onSelect?(item, indexPath.row)
    }
}
