//
//  EDTSRangeSlider.swift
//  EDTSCode
//
//  Created by M Alfin Syahruddin on 26/05/23.
//

import UIKit
import QuartzCore


@IBDesignable
public class EDTSRangeSlider: UIControl {
    @IBInspectable public var minimumValue: Double = 0 {
        didSet {
            updateLayerFrames()
        }
    }
    
    @IBInspectable public var maximumValue: Double = 100 {
        didSet {
            updateLayerFrames()
        }
    }
    
    @IBInspectable public var lowerValue: Double = 0 {
        didSet {
            if lowerValue < minimumValue {
                lowerValue = minimumValue
            }
            updateLayerFrames()
        }
    }
    
    @IBInspectable public var upperValue: Double = 100 {
        didSet {
            if upperValue > maximumValue {
                upperValue = maximumValue
            }
            updateLayerFrames()
        }
    }
    
    public var gapBetweenThumbs: Double {
        return 0.5 * Double(thumbWidth) * (maximumValue - minimumValue) / Double(bounds.width)
    }
    
    @IBInspectable public var trackTintColor: UIColor = .black.withAlphaComponent(0.15) {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var trackHighlightTintColor: UIColor = EDTSColor.primary30 {
        didSet {
            trackLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var thumbTintColor: UIColor = EDTSColor.primary30 {
        didSet {
            lowerThumbLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    @IBInspectable public var thumbBorderColor: UIColor = UIColor.white {
        didSet {
            lowerThumbLayer.strokeColor = thumbBorderColor
            upperThumbLayer.strokeColor = thumbBorderColor
        }
    }
    
    @IBInspectable public var thumbBorderWidth: CGFloat = 1.5 {
        didSet {
            lowerThumbLayer.lineWidth = thumbBorderWidth
            upperThumbLayer.lineWidth = thumbBorderWidth
        }
    }
    
    @IBInspectable public var curvaceousness: CGFloat = 12 {
        didSet {
            if curvaceousness < 0.0 {
                curvaceousness = 0.0
            }
            
            if curvaceousness > 1.0 {
                curvaceousness = 1.0
            }
            
            trackLayer.setNeedsDisplay()
            lowerThumbLayer.setNeedsDisplay()
            upperThumbLayer.setNeedsDisplay()
        }
    }
    
    public var onChange: ((_ lowerValue: Double, _ upperValue: Double) -> Void)?
    
    private var previouslocation = CGPoint()
    
    private let trackLayer = EDTSRangeSliderTrackLayer()
    private let lowerThumbLayer = EDTSRangeSliderThumbLayer()
    private let upperThumbLayer = EDTSRangeSliderThumbLayer()
    
    private var thumbWidth: CGFloat {
        return CGFloat(bounds.height)
    }
    
    override public var frame: CGRect {
        didSet {
            updateLayerFrames()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initializeLayers()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeLayers()
    }
    
    override public func layoutSublayers(of: CALayer) {
        super.layoutSublayers(of:layer)
        updateLayerFrames()
    }
    
    private func initializeLayers() {
        layer.backgroundColor = UIColor.clear.cgColor
        
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.rangeSlider = self
        lowerThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(upperThumbLayer)
    }
    
    func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: bounds.height/3)
        trackLayer.setNeedsDisplay()
        
        let lowerThumbCenter = CGFloat(positionForValue(lowerValue))
        lowerThumbLayer.frame = CGRect(x: lowerThumbCenter - thumbWidth/2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        lowerThumbLayer.setNeedsDisplay()
        
        let upperThumbCenter = CGFloat(positionForValue(upperValue))
        upperThumbLayer.frame = CGRect(x: upperThumbCenter - thumbWidth/2.0, y: 0.0, width: thumbWidth, height: thumbWidth)
        upperThumbLayer.setNeedsDisplay()
        
        CATransaction.commit()
    }
    
    func positionForValue(_ value: Double) -> Double {
        return Double(bounds.width - thumbWidth) * (value - minimumValue) /
            (maximumValue - minimumValue) + Double(thumbWidth/2.0)
    }
    
    func boundValue(_ value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    
    // MARK: - Touches
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previouslocation = touch.location(in: self)
        
        // Hit test the thumb layers
        if lowerThumbLayer.frame.contains(previouslocation) {
            lowerThumbLayer.highlighted = true
        } else if upperThumbLayer.frame.contains(previouslocation) {
            upperThumbLayer.highlighted = true
        }
        
        return lowerThumbLayer.highlighted || upperThumbLayer.highlighted
    }
    
    override public func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        // Determine by how much the user has dragged
        let deltaLocation = Double(location.x - previouslocation.x)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - bounds.height)
        
        previouslocation = location
        
        // Update the values
        if lowerThumbLayer.highlighted {
            lowerValue = boundValue(lowerValue + deltaValue, toLowerValue: minimumValue, upperValue: upperValue - gapBetweenThumbs)
        } else if upperThumbLayer.highlighted {
            upperValue = boundValue(upperValue + deltaValue, toLowerValue: lowerValue + gapBetweenThumbs, upperValue: maximumValue)
        }
        
        self.onChange?(lowerValue, upperValue)
        
        return true
    }
    
    override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbLayer.highlighted = false
        upperThumbLayer.highlighted = false
    }
}
