//
//  ViewController.swift
//  so61984099
//
//  Created by Olha Pavliuk on 24.05.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var customLabel: CustomTextLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewW = view.frame.width, viewH = view.frame.height
        let labelW: CGFloat = 200, labelH: CGFloat = 50
        
        customLabel = CustomTextLabel(frame: CGRect(x: (viewW-labelW)/2, y: (viewH-labelH)/2, width: labelW, height: labelH))
        customLabel.setText("Optimizing...", fontSize: 20)
        view.addSubview(customLabel)
        
        let tapRecogniner = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tapRecogniner)
    }

    @objc func onTap() {
        customLabel.animateText(leftPartColor1: UIColor.blue,
                                leftPartColor2: UIColor.red,
                                rightPartColor1: UIColor.white,
                                rightPartColor2: UIColor.black)
    }

}

