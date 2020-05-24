//
//  CustomUILabel.swift
//  so61984099
//
//  Created by Olha Pavliuk on 24.05.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

//https://stackoverflow.com/questions/61984099/is-is-possible-to-animate-text-color-changing-only-in-a-part-of-text-in-ios

import Foundation
import UIKit

class CustomTextLabel: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var textLayer1: CATextLayer?
    private var textLayer2: CATextLayer?
    
    func setText(_ text: String, fontSize: CGFloat) {
        // create 2 layers with the same text and size, we'll set the colors for them later
        textLayer1 = createTextLayer(text, fontSize: fontSize)
        textLayer2 = createTextLayer(text, fontSize: fontSize)
        
        // estimate the frame size needed for the text layer with such text and font size
        let textSize = textLayer1!.preferredFrameSize()
        let w = frame.width, h = frame.height
        
        // calculate the frame such that both layers will be in center of view
        let centeredTextFrame = CGRect(x: (w-textSize.width)/2, y: (h-textSize.height)/2, width: textSize.width, height: textSize.height)
        textLayer1!.frame = centeredTextFrame
        textLayer2!.frame = centeredTextFrame
        
        // set up default color for the text
        textLayer1!.foregroundColor = UIColor.yellow.cgColor
        textLayer2!.foregroundColor = UIColor.yellow.cgColor
        
        // set background transparent, that's very important
        textLayer1!.backgroundColor = UIColor.clear.cgColor
        textLayer2!.backgroundColor = UIColor.clear.cgColor
        
        // set up masks, such that each layer's text is visible only in its part
        textLayer1!.mask = createMaskLayer(CGRect(x: 0, y: 0, width: textSize.width/2, height: textSize.height))
        textLayer2!.mask = createMaskLayer(CGRect(x: textSize.width/2, y: 0, width: textSize.width/2, height: textSize.height))
            
        layer.addSublayer(textLayer1!)
        layer.addSublayer(textLayer2!)
    }
    
    private var finishColor1: UIColor = .black, finishColor2: UIColor = .black
    func animateText(leftPartColor1: UIColor, leftPartColor2: UIColor, rightPartColor1: UIColor, rightPartColor2: UIColor) {
        finishColor1 = leftPartColor2
        finishColor2 = rightPartColor2
        
        if let layer1 = textLayer1, let layer2 = textLayer2 {
            CATransaction.begin()
            let animation1 = CABasicAnimation(keyPath: "foregroundColor")
            animation1.fromValue = leftPartColor1.cgColor
            animation1.toValue = leftPartColor2.cgColor
            animation1.duration = 3.0
            layer1.add(animation1, forKey: "animation1")
            
            
            let animation2 = CABasicAnimation(keyPath: "foregroundColor")
            animation2.fromValue = rightPartColor1.cgColor
            animation2.toValue = rightPartColor2.cgColor
            animation2.duration = 3.0
            layer2.add(animation2, forKey: "animation2")
            
            CATransaction.setCompletionBlock {
                self.textLayer1?.foregroundColor = self.finishColor1.cgColor
                self.textLayer2?.foregroundColor = self.finishColor2.cgColor
            }
            
            CATransaction.commit()
        }
    }
    
    private func createTextLayer(_ text: String, fontSize: CGFloat) -> CATextLayer {
        let textLayer = CATextLayer()
        textLayer.string = text
        textLayer.fontSize = fontSize // TODO: also set font name
        textLayer.contentsScale = UIScreen.main.scale
        
        return textLayer
    }
    
    private func createMaskLayer(_ holeRect: CGRect) -> CAShapeLayer {
        let layer = CAShapeLayer()
        
        let path = CGMutablePath()

        path.addRect(holeRect)
        path.addRect(bounds)

        layer.path = path
        layer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.opacity = 1
        
        return layer
    }
}
