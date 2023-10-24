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

}
