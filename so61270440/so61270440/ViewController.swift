//
//  ViewController.swift
//  so61270440
//
//  Created by Olha Pavliuk on 17.04.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var diagonalShiftSlider: UISlider!
    
    @IBOutlet weak var targetView: UIView!
    private let textLayer = CATextLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textLayer.string = "Some Text"
        targetView.layer.addSublayer(textLayer)
        textLayer.frame = targetView.layer.bounds
        textLayer.backgroundColor = UIColor.clear.cgColor
        
        setupSliders()
        updateTextLayer()
    }
    
    private func setupSliders() {
        angleSlider.minimumValue = 0
        angleSlider.maximumValue = 1
        angleSlider.value = 0.5
        
        diagonalShiftSlider.minimumValue = 0
        diagonalShiftSlider.maximumValue = 200
        diagonalShiftSlider.value = 100
    }

    private func updateTextLayer() {
        let rotationPoint = CGPoint(x: 30, y: 0)
        let shift = CGFloat(diagonalShiftSlider.value)
        
        var transform = CATransform3DTranslate(CATransform3DIdentity, -rotationPoint.x, -rotationPoint.y, 0)
        transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(angleSlider.value * .pi), 0, 0, 0)
        transform = CATransform3DTranslate(CATransform3DIdentity, rotationPoint.x, rotationPoint.y, 0)
        
        
        textLayer.transform = transform
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        updateTextLayer()
    }
    
    @IBAction func diagonalShiftChanged(_ sender: Any) {
        updateTextLayer()
    }
}

