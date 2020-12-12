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
        
        let webView = WKWebView(frame: view.bounds)
        let request = URLRequest(url: svgUrlLocal)
        //let request = URLRequest(url: svgUrlRemote)
        webView.load(request)
        view.addSubview(webView)
    }
    
    var svgUrlLocal: URL {
        let path = Bundle.main.path(forResource: "3874453", ofType: "svg")!
        return URL(fileURLWithPath: path)
    }
    
    var svgUrlRemote: URL {
        let path = "https://www.flaticon.com/svg/static/icons/svg/3874/3874453.svg"
        return URL(string: path)!
    }


}

