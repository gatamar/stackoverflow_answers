//
//  ViewController.swift
//  so61454871
//
//  Created by Olha Pavliuk on 01.05.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

import UIKit
import Photos

// https://stackoverflow.com/questions/61454871/get-video-or-video-info-without-open-gallery-swift

class ViewController: UIViewController {

    private func requestAccessToLibrary() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                print("Photos library autorization succeed! 🎉")
                DispatchQueue.main.async {
                    self.fetchVideos()
                }
                
            default:
                print("Photos library autorization failed")
            }
        }
    }
    
    private func fetchVideos() {
        let videosAlbum = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumVideos, options: nil)
//        print(videosAlbum.count)
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true) ]
        options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.video.rawValue)
        let assets = PHAsset.fetchAssets(in: videosAlbum.object(at: 0), options: options)
        assert(assets.count == 0)
        assert(assets.count > 0)
        
//        //"videos" is of type PHFetchResult: https://developer.apple.com/documentation/photokit/phfetchresult
//        let videos = PHAsset.fetchAssets(with: .video, options: nil)
//        if videos.count > 0 {
//            for i in 0 ..< videos.count {
//                print("One more video: \(videos[i])")
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make sure "NSPhotoLibraryUsageDescription" is added in Info.plist, because in the other case we'll get a crash
        requestAccessToLibrary()
    }


    
}

