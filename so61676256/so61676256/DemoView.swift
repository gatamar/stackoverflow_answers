//
//  DemoView.swift
//  so61676256
//
//  Created by Olha Pavliuk on 10.05.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

import Foundation
import Cocoa

class DemoView: NSView {
    override func draw(_ rect: NSRect) {

        let image = NSImage(named: "test_image.jpg")!

        if let context = NSGraphicsContext.current?.cgContext {
            context.saveGState()

            NSColor.red.set()  // just for demo
            rect.fill()        // just for demo
            
            image.draw(in: rect)
            
            let text: NSString = "Hello World"
            let attributes = [
                NSAttributedString.Key.foregroundColor: NSColor.white,
                NSAttributedString.Key.font: NSFont.systemFont(ofSize: 24)
            ]

            let size = bounds.size
            let rotatedTextCenter = CGPoint(x: size.width*0.8, y: size.height/2)
            
            // draw the the circle in desired center to check if text was transformed correctly
            drawCircleInView(context: context, center: rotatedTextCenter)
            
            // draw the rotated text so its center fits the circle center
            drawAttributedTextInView(text: text, textAttributes: attributes, context: context, viewSize: size, centerInView: rotatedTextCenter)
            
            context.restoreGState()
        }
    }
    
    func drawCircleInView(context: CGContext, center: CGPoint) {
        context.setLineWidth(5)
        context.setFillColor(NSColor.red.cgColor)
        context.addArc(center: center, radius: 10, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: false)
        context.fillPath()
    }
    
    func drawAttributedTextInView(text: NSString,
                                  textAttributes: [NSAttributedString.Key:Any],
                                  context: CGContext,
                                  viewSize: CGSize,
                                  centerInView textCenter: CGPoint) {

        // we assume everything else was already drawn and context has identity transform for the simplicity

        let textSize = text.size(withAttributes: textAttributes)

        context.translateBy(x: textCenter.x+textSize.height/2, y: textCenter.y-textSize.width/2)
        context.rotate(by: CGFloat.pi / 2)
        
        text.draw(at: .zero, withAttributes: textAttributes)
    }
}
