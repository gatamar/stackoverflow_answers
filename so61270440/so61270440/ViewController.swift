//
//  ViewController.swift
//  so61270440
//
//  Created by Olha Pavliuk on 17.04.2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class MyClass: NSCoding, Codable {
    func encode(with coder: NSCoder) {
        
    }
    init() {
        
    }
    required init?(coder: NSCoder) {
        
    }
    
    
}
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
    
    private func save() throws {
      let fileManager = FileManager.default

//      do {

        let fileName: String = ""
        let object = MyClass()
        
        if !fileManager.fileExists(atPath: fileName) {
            //let data = NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false) {
            
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
        }
//      }
    }
    
    private func load() throws {
      let fileManager = FileManager.default
      do {
        let cacheDirectory = try fileManager.url(for: .cachesDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let fileDirectory = cacheDirectory.appendingPathComponent("spacekit")

        var fileDir = fileDirectory.absoluteString
        let range = fileDir.startIndex..<fileDir.index(fileDir.startIndex, offsetBy: 7)
        fileDir.removeSubrange(range)

//        try createFolderIfNeeded(atPath: fileDir, absolutePath: fileDirectory)

        let paths = try fileManager.contentsOfDirectory(atPath: fileDir)

        for path in paths {
            let objData = try Data(contentsOf: URL(fileURLWithPath: fileDir + path))
            if let object = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [MyClass.self], from: objData) {
            if false {
              add(object: object)
            } else {
              try? fileManager.removeItem(atPath: fileDir + path)
            }
          }
        }
      } catch {
//        throw Operations.loadFail
      }
    }

}


