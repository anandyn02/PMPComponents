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
