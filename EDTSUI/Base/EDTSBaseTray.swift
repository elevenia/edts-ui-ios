//
//  EDTSBaseTray.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 07/05/23.
//

import UIKit


public protocol EDTSBaseTrayDelegate: AnyObject {
    var containerTray: UIView! { get set }
    var containerTrayBottomAnchor: NSLayoutConstraint! { get set }
}

open class EDTSBaseTray: UIViewController {
    /// Assign this delegate to self in `viewDidLoad` lifecycle
    /// Example: `self.trayDelegate = self`
    public weak var trayDelegate: EDTSBaseTrayDelegate?
    
    private let backgroundView = UIView()
    private let bottomInsets = UIView()
    
    public var trayDisablePanGesture: Bool = false
    public var bottomOffset: CGFloat {
        return self.view.safeAreaInsets.bottom == 0 ? -23 : 0
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        self.commonInit()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.modalPresentationStyle = .overCurrentContext
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupUI()
        self.setupHandlers()
    }

    private func setupUI() {
        guard let trayDelegate = trayDelegate else { return }
        
        // Bottom insets
        self.bottomInsets.backgroundColor = .white.withAlphaComponent(0)
        self.view.addSubview(bottomInsets)
        self.view.sendSubviewToBack(bottomInsets)
        
        self.bottomInsets.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomInsets.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomInsets.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomInsets.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomInsets.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Background View
        self.view.addSubview(backgroundView)
        self.view.sendSubviewToBack(backgroundView)
        
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        // Hide the Tray on Initial (before `viewDidAppear`)
        self.view.backgroundColor = .clear
        self.backgroundView.backgroundColor = .black.withAlphaComponent(0)
        trayDelegate.containerTrayBottomAnchor.constant = -trayDelegate.containerTray.frame.height
    }
    
    private func setupHandlers() {
        guard let trayDelegate = trayDelegate else { return }

        // Pan Gesture
        if !trayDisablePanGesture {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            panGesture.delaysTouchesBegan = false
            panGesture.delaysTouchesEnded = false
            panGesture.delegate = self
            trayDelegate.containerTray.addGestureRecognizer(panGesture)
        }
    
        // Dismiss the Tray when the background is tapped.
        backgroundView.isUserInteractionEnabled = true
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackgroundView)))
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let trayDelegate = trayDelegate else { return }
                    
        // Show the Tray on Initial
        trayDelegate.containerTrayBottomAnchor.constant = bottomOffset
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0.5,
            options: .curveEaseOut
        ) {
            self.view.layoutIfNeeded()
            self.bottomInsets.backgroundColor = .white.withAlphaComponent(1)
            self.backgroundView.backgroundColor = .black.withAlphaComponent(0.5)
        }
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let trayDelegate = trayDelegate else { return }

        let translation = gesture.translation(in: view)
        
        // hide bottom insets on pan down
        self.bottomInsets.isHidden = trayDelegate.containerTrayBottomAnchor.constant < 0
     
        // allow for pan up gesture (max 10pt)
        trayDelegate.containerTrayBottomAnchor.constant = min(10, -translation.y)
                                
        // handle end pan gesture
        if gesture.state == .ended {
            if trayDelegate.containerTrayBottomAnchor.constant < -50 {
                // dismiss the Tray
                self.dismiss(animated: true)
            } else {
                // Show the Tray again
                trayDelegate.containerTrayBottomAnchor.constant = bottomOffset
                UIView.animate(
                    withDuration: 0.25,
                    delay: 0,
                    options: .curveEaseOut,
                    animations: {
                        self.view.layoutIfNeeded()
                    },
                    completion: { _ in
                        self.bottomInsets.isHidden = false
                    }
                )
            }
        }
    }
    
    @objc private func didTapBackgroundView() {
        self.dismiss(animated: true)
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        guard let trayDelegate = trayDelegate else { return }
        
        // Dismiss the Tray with animation.
        trayDelegate.containerTrayBottomAnchor.constant = -trayDelegate.containerTray.frame.height
        UIView.animate(
            withDuration: 0.25,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                self.view.layoutIfNeeded()
                self.backgroundView.backgroundColor = .black.withAlphaComponent(0)
            },
            completion: { _ in
                super.dismiss(animated: false, completion: completion)
            }
        )
    }
}


extension EDTSBaseTray: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Only handle vertical pan gesture
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let velocity = pan.velocity(in: self.view)
            return abs(velocity.y) > abs(velocity.x)
        }
        return true
    }
        
}
