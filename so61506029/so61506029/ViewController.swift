//
//  ViewController.swift
//  so61506029
//
//  Created by Olha Pavliuk on 29.04.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        someNetworkClient()
    }

    func someNetworkClient() {
        let network = DefaultNetwork()
        network.func1()
    }

}

