//
//  File.swift
//  
//
//  Created by Anand  on 16/10/23.
//

import UIKit
import Stevia

public class Avatar: UIView {
    
   public func configure(_ images: [URL?], size: CGFloat, placeholder: String) {
        subviews.forEach({$0.removeFromSuperview()})
        switch images.count {
        case 0: break
        case 1:
            let img1 = image(images[0], size: size, placeholder: placeholder)
            subviews(img1)
            img1.fillContainer()
        case 2:
            let img1 = image(images[0], size: size/1.5, placeholder: placeholder)
            let img2 = image(images[1], size: size/1.5, placeholder: placeholder)
            subviews(img1, img2)
            align(horizontally: img1.left(0).centerVertically(), img2.right(0).centerVertically())
        default:
            let img1 = image(images[0], size: size/1.5, placeholder: placeholder)
            let img2 = image(images[1], size: size/1.5, placeholder: placeholder)
            let img3 = image(images[2], size: size/1.5, placeholder: placeholder)
            subviews(img2, img1, img3)
            img1.centerHorizontally().top(0)
            align(horizontally: img2.left(0).centerVertically(offset: 2), img3.right(0).centerVertically(offset: 2))
        }
    }
    
   public func image(_ image: URL?, size: CGFloat, placeholder: String) -> UIImageView {
        
        let imageview = UIImageView()
        imageview.size(size)
        imageview.contentMode = .scaleAspectFill
        imageview.loadImage(image, placeHolderName: placeholder)
        imageview.layer.cornerRadius = size/2
        imageview.layer.borderColor = UIColor.white.cgColor
        imageview.layer.borderWidth = 2
        imageview.layer.shadowRadius = 4
        imageview.layer.shadowOpacity = 1
        imageview.layer.masksToBounds = true
        
        return imageview
      
    }
}
