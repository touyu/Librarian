//
//  UIImageView+Extensions.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/26.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit
import Kingfisher


extension UIImageView {
    func set(url: URL?) {
        kf.setImage(with: url, placeholder: nil, options: imageOptions)
    }
    
    private var imageOptions: [KingfisherOptionsInfoItem] {
        let cache = ImageCache(name: "flamingo_image_cache")
        cache.maxDiskCacheSize = UInt(1024 * 1024 * 1000) // 1GB
        let size = CGSize(width: bounds.width*2, height: bounds.height*2)
        let processor = ResizingImageProcessor(referenceSize: size, mode: .aspectFill)
        return [.targetCache(cache), .processor(processor)]
    }
}
