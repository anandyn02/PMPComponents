//
//  File.swift
//  
//
//  Created by Anand  on 30/10/23.
//

import UIKit

public class QRGenerator {
    
    public class func generateQRCode(from string: String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let QRImage = QRFilter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: QRImage)
            }
            
            //            guard let QRImage = QRFilter.outputImage else {return nil}
            //            return UIImage(ciImage: QRImage)
        }
        return nil
    }
    
}


