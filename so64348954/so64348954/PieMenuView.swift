//
//  PieMenuView.swift
//  so64348954
//
//  Created by Olha Pavliuk on 14.10.2020.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import UIKit

class HackLinesView: UIView {
    init(frame: CGRect, partsCount parts: Int) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        let side = frame.width/2
        // add lines
        for part in 0..<parts {
            let angle = CGFloat(part)/CGFloat(parts) * 2 * .pi
            let lineLayer = CAShapeLayer()
            lineLayer.backgroundColor = UIColor.black.cgColor
            let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: side))
            lineLayer.path = path.cgPath
            lineLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
            layer.addSublayer(lineLayer)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
class PieMenuView: UIView {
    init(frame: CGRect, partsCount parts: Int) {
        assert( abs(frame.width-frame.height) < 0.001)
        super.init(frame: frame)
        setupLayers(parts)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayers(_ parts: Int) {
        let side = bounds.width
        let outerRadius = side * 0.5
        let innerRadius = side * 0.2
        
        // add outer circle
        let outerCircleLayer = CAShapeLayer()
        outerCircleLayer.frame = bounds
        outerCircleLayer.cornerRadius = outerRadius
        outerCircleLayer.backgroundColor = UIColor.orange.cgColor
        layer.addSublayer(outerCircleLayer)
        
        // add inner circle
        let innerCircleLayer = CAShapeLayer()
        innerCircleLayer.frame = CGRect(x: side/2-innerRadius, y: side/2-innerRadius, width: innerRadius*2, height: innerRadius*2)
        innerCircleLayer.cornerRadius = innerRadius
        innerCircleLayer.backgroundColor = UIColor.yellow.cgColor
        layer.addSublayer(innerCircleLayer)
        
        let linesView = HackLinesView(frame: CGRect(x: side/2, y: side/2, width: side, height: side), partsCount: parts)
        addSubview(linesView)
        
        // add text
        for part in 0..<parts {
            let angle = CGFloat(part)/CGFloat(parts) * 2 * .pi
            
            let textLayer = CATextLayer()
            textLayer.string = String(format: "%d", part)
            textLayer.foregroundColor = UIColor.blue.cgColor
            
            // calc the center for text layer
            let x1 = side/2
            let y1 = side/2
            let x2 = x1 + cos(angle)*outerRadius
            let y2 = y1 + sin(angle)*outerRadius
            
            let textCenterX = (x1 + x2)/2, textCenterY = (y1 + y2)/2
            let textLayerSide: CGFloat = 50
            
            textLayer.frame = CGRect(x: textCenterX-textLayerSide/2, y: textCenterY-textLayerSide/2, width: textLayerSide, height: textLayerSide)
            
            layer.addSublayer(textLayer)
        }
    }
}
