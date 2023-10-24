//
//  File.swift
//  
//
//  Created by Anand  on 16/10/23.
//

import UIKit
import Kingfisher

public extension UIImageView {
    func loadImage(_ url: URL?, placeHolderName:  String) {
        guard let imageURL = url else {
            image = UIImage(named: placeHolderName)
            return
        }
        //#imageLiteral(resourceName: "avatarPlaceholder")
        kf.setImage(with: imageURL, placeholder: UIImage(named: placeHolderName))
    }
}


public extension UIImage {
    
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    
    func resize(scaledToWidth desiredWidth: CGFloat) -> UIImage {
        let oldWidth = size.width
        let scaleFactor = desiredWidth / oldWidth
        
        let newHeight = size.height * scaleFactor
        let newWidth = oldWidth * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        return resize(targetSize: newSize)
    }
    
    func resize(scaledToHeight desiredHeight: CGFloat) -> UIImage {
        let scaleFactor = desiredHeight / size.height
        let newWidth = size.width * scaleFactor
        let newSize = CGSize(width: newWidth, height: desiredHeight)
        
        return resize(targetSize: newSize)
    }
    
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    
    func compress(to kb: Int, allowedMargin: CGFloat = 0.2) -> Data {
        let bytes = kb * 1024
        var compression: CGFloat = 1.0
        let step: CGFloat = 0.05
        var holderImage = self
        var complete = false
        while(!complete) {
            if let data = holderImage.jpegData(compressionQuality: 1.0) {
                let ratio = data.count / bytes
                if data.count < Int(CGFloat(bytes) * (1 + allowedMargin)) {
                    complete = true
                    return data
                } else {
                    let multiplier:CGFloat = CGFloat((ratio / 5) + 1)
                    compression -= (step * multiplier)
                }
            }
            
            guard let newImage = holderImage.resized(withPercentage: compression) else { break }
            holderImage = newImage
        }
        return Data()
    }
    
}
