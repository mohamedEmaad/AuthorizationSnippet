//
//  CacheImageView.swift
//  EstsharaProject
//
//  Created by Mohamed Emad on 12/30/18.
//  Copyright © 2018 Baianat. All rights reserved.
//

import UIKit
import AVKit

open class CacheImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    func getThumbnailImage(url: URL?, placeHolder: UIImage, tag: Int) {
        if url == nil{
            self.image = placeHolder
            return
        }
        
        if let cachedImage = imageCache.object(forKey: url!.absoluteString as NSString) {
            self.image = cachedImage
        } else {
            self.image = placeHolder
            DispatchQueue.global().async {
                let asset = AVAsset(url: url!)
                let assetImgGenerate : AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
                assetImgGenerate.appliesPreferredTrackTransform = true
                let time = CMTimeMake(value: 1, timescale: 1)
                let img = try? assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                if img != nil {
                    let frameImg  = UIImage(cgImage: img!)
                    DispatchQueue.main.async(execute: {
                        // assign your image to UIImageView
                        self.imageCache.setObject(frameImg, forKey: url!.absoluteString as NSString)
                        self.image = frameImg
                    })
                }
            }
        }
    }
    
}
