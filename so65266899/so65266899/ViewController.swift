//
//  ViewController.swift
//  so65266899
//
//  Created by Olha Pavliuk on 12.12.2020.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = "https://www.flaticon.com/svg/static/icons/svg/3874/3874453.svg"
        let data = try! Data(contentsOf: URL(string: path)!)
        
        let webView = WKWebView(frame: view.bounds)
        let request = URLRequest(url: URL(string: path)!)
        webView.load(request)
        view.addSubview(webView)
        
        let imageView = UIImageView(frame: view.bounds)
        let image = UIImage(data: data)
        imageView.image = image
        view.addSubview(imageView)
    }


}

