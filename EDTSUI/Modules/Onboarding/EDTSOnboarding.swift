//
//  EDTSOnboarding.swift
//  EDTSUI
//
//  Created by Victor Toya on 27/09/22.
//

import UIKit

public protocol EDTSOnboardingDelegate {
    func onOnboardingScrolled(index: Int)
}

@IBDesignable public class EDTSOnboarding: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var pageControl = UIPageControl()
    private var datas = [EDTSOnboardingData]()
    private var contentPositions = [CGFloat]()
    
    public var delegate: EDTSOnboardingDelegate?
    
    @IBInspectable var titleFontName: String {
        get {
            return titleFont
        }
        set {
            titleFont = newValue
        }
    }

    @IBInspectable var titleFontSize: Int {
        get {
            return titleSize
        }
        set {
            titleSize = newValue
        }
    }
    
    @IBInspectable var titleFontColor: UIColor {
        get {
            return titleColor
        }
        set {
            titleColor = newValue
        }
    }
    
    @IBInspectable var messageFontName: String {
        get {
            return messageFont
        }
        set {
            messageFont = newValue
        }
    }
    
    @IBInspectable var messageFontSize: Int {
        get {
            return messageSize
        }
        set {
            messageSize = newValue
        }
    }
    
    @IBInspectable var messageFontColor: UIColor {
        get {
            return messageColor
        }
        set {
            messageColor = newValue
        }
    }
    
    @IBInspectable var alignment: Int {
        get {
            return contentAlignment.rawValue
        }
        set {
            setContentAlignment(number: newValue)
        }
    }
    
    var titleFont = "--"
    var titleSize = 24
    var titleColor = UIColor.black
    var messageFont = "--"
    var messageSize = 14
    var messageColor = UIColor.lightGray
    
    var contentAlignment = EDTSContentAlignment.left
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNib()
    }
    
    private func setupNib() {
        let frameworkBundle = Bundle(for: EDTSOnboarding.self)
        frameworkBundle.loadNibNamed("EDTSOnboarding", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setContentAlignment(number: Int) {
        if number == 0 {
            contentAlignment = .left
        } else if number == 1 {
            contentAlignment = .center
        } else {
            contentAlignment = .right
        }
    }
    
    public func scrollContent() {
        if datas.count > 0 {
            if pageControl.currentPage == contentPositions.count-1 {
                pageControl.currentPage = 0
                scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.frame.minY), animated: true)
                self.delegate?.onOnboardingScrolled(index: Int(pageControl.currentPage))
            } else {
                scrollView.setContentOffset(CGPoint(x: contentPositions[pageControl.currentPage + 1], y: scrollView.frame.minY), animated: true)
                pageControl.currentPage = pageControl.currentPage + 1
                self.delegate?.onOnboardingScrolled(index: Int(pageControl.currentPage))
            }
        }
    }
    
    public func loadContent(datas: [EDTSOnboardingData]) {
        self.datas = datas
        self.pageControl.numberOfPages = datas.count
        
        var index = 0
        for item in datas {
            let content = EDTSOnboardingContent(frame: CGRect(x: scrollView.frame.size.width * CGFloat(index), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), data: item, titleFont: titleFont, titleSize: titleSize, titleColor: titleColor, messageFont: messageFont, messageSize: messageSize, messageColor: messageColor, contentAlignment: contentAlignment)
            
            scrollView.addSubview(content)
            
            contentPositions.append(scrollView.frame.size.width * CGFloat(index))
            index = index + 1
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.self.width * CGFloat(index), height: scrollView.frame.size.height)
        scrollView.contentInset.bottom = -100 //Disable Vertical Scroll
    }
}

extension EDTSOnboarding: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        pageControl.currentPage = Int(currentPage)
        self.delegate?.onOnboardingScrolled(index: Int(currentPage))
    }
}
