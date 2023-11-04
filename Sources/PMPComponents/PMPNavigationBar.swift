//
//  File.swift
//  
//
//  Created by Anand  on 04/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PMPNavigationBar: UIView {
    
    public var backButton = IOComponent.createButton(text: "", titleColor: .black, bgColor: .clear)
    public let navTitle = IOComponent.createLabel(text: "Media", font: .systemFont(ofSize: 14), color: .black)
    public let div = IOComponent.createView(bgColor: UIColor(red: 201/255, green: 197/255, blue: 202/255, alpha: 1.0))

    public override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func configure(){
        
        subviews {
            backButton
            navTitle
            div
        }
        
        layout {
            
            |-10-backButton.width(40).height(40)
            10
            |-0-div-0-|
            1
        }
        
        navTitle.bottom(20).centerHorizontally()
        height(90)
        
    }
}
