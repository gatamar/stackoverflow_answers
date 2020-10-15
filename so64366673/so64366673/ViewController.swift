//
//  ViewController.swift
//  so64366673
//
//  Created by Olha Pavliuk on 15.10.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

protocol MyCustomLabelDelegate: class {
    func labelTapped2(_ label: UILabel)
}

class MyCustomLabel: UILabel {
    weak var delegate: MyCustomLabelDelegate?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        delegate?.labelTapped2(self)
    }
}

class ViewController: UIViewController, MyCustomLabelDelegate {
    
    func labelTapped2(_ label: UILabel) {
        print("labelTapped: \(label.text)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        label1.backgroundColor = .blue
        label1.text = "@mentioned"
        label1.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        label1.addGestureRecognizer(tapGesture)
        
        view.addSubview(label1)
        
        let label2 = MyCustomLabel(frame: CGRect(x: 300, y: 250, width: 100, height: 50))
        label2.backgroundColor = .red
        label2.text = "@mentioned"
        label2.delegate = self
        label2.isUserInteractionEnabled = true
        view.addSubview(label2)
    }

    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        print("labelTapped: \(gesture)")
    }
    
}

