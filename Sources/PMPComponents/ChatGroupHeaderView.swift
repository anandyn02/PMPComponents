//
//  ChatGroupHeaderView.swift
//  
//
//  Created by Anand  on 22/10/23.
//

import UIKit
import PMP_Component
import Stevia

public class ChatGroupHeaderView: UIView {
    
    public let label = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 14), color: .black)
    public let subLabel = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 12), color: .lightGray)
    public let avatar = IOComponent.createImageView(radius: 40, bgColor: .clear)
    
    public override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func configure(){
        
        subviews {
            avatar
            label
            subLabel
        }
        
        avatar.width(80).height(80)
        
        layout {
            20
            avatar.centerHorizontally()
            10
            |-20-label-20-|
            2
            |-20-subLabel-20-|
            20
            
        }
        
    }
   

}
