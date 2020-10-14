//
//  ViewController.swift
//  so64348954
//
//  Created by Olha Pavliuk on 14.10.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.frame.width, h = view.frame.height
        let minSide = min(w,h) * 0.8
        let pieFrame = CGRect(x: w/2-minSide/2, y: h/2-minSide/2, width: minSide, height: minSide)
        let pieView = PieMenuView(frame: pieFrame, partsCount: 9)
        view.addSubview(pieView)
    }

}

