//
//  ViewController.swift
//  so61676256
//
//  Created by Olha Pavliuk on 08.05.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

// https://stackoverflow.com/questions/61676256/drawing-text-on-right-side-of-nsimage-unwanted-spacing

import Cocoa

class ViewController: NSViewController {

    var demoView: DemoView?
    override func viewDidLoad() {
        super.viewDidLoad()
        demoView = DemoView(frame: demoFrame)
        view.addSubview(demoView!)
    }
    
    private var demoFrame: CGRect {
        let width = view.frame.width, height = view.frame.height
        return CGRect(x: width/4, y: height/4, width: width/2, height: height/2)
    }
    
    override func viewDidLayout() {
        demoView?.frame = demoFrame
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

