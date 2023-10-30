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
    
    public let label = IOComponent.createTextField(text: "Enter Group Name", textColor: .black, font: .systemFont(ofSize: 16))
    public let subLabel = IOComponent.createTextField(text: "Enter Group Description", textColor: .lightGray, font: .systemFont(ofSize: 12))
    public let avatar = IOComponent.createImageView(radius: 40, bgColor: .clear)
        
    public var isEditable: Bool = false {
        didSet {
            updateUI()
        }
    }

    public override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    private func updateUI() {
        label.isEnabled = isEditable
      //  subLabel.isEnabled = isEditable
        
//        label.textAlignment = isEditable ? .left : .center
//        subLabel.textAlignment = isEditable ? .left : .center
    }
    
    func configure(){
        
        isEditable = false
        
        subviews {
            avatar
            label
          //  subLabel
        }
        
        avatar.width(80).height(80)
        
        layout {
            20
            avatar.centerHorizontally()
            10
            |-20-label.height(50)-20-|
            20
//            |-20-subLabel.height(30)-20-|
//            20
            
        }
        
    }
   

}
