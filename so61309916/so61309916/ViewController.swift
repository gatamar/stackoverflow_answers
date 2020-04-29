//
//  ViewController.swift
//  so61309916
//
//  Created by Olha Pavliuk on 19.04.2020.
//  Copyright © 2020 test. All rights reserved.
//

import Cocoa
import CoreGraphics

class MyView: NSView {
    var imageView: NSImageView!
    var textLayer: CATextLayer!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frame)
        imageView = NSImageView(frame: bounds)
        textLayer = CATextLayer()
        addSubview(<#T##view: NSView##NSView#>)
            //NSImageView(frame: bounds)
    }
}

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

