//
//  File.swift
//  
//
//  Created by Anand  on 16/10/23.
//

import UIKit

public extension UIView {

  // OUTPUT 1
  func PMPDropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func PMPDropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
    
    func addDashedCircle(strokeColor: UIColor, fillColor: UIColor) {
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        circleLayer.lineWidth = 2.0
        circleLayer.strokeColor =  strokeColor.cgColor//border of circle
        circleLayer.fillColor = fillColor.cgColor//inside the circle
        circleLayer.lineJoin = .round
        circleLayer.lineDashPattern = [6,3]
        layer.addSublayer(circleLayer)
    }
    
}
