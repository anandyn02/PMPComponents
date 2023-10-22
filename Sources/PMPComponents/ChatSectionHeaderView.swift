//
//  ChatSectionHeaderView.swift
//  
//
//  Created by Anand  on 22/10/23.
//

import UIKit
import Stevia
import PMP_Component

public class ChatSectionHeaderView: UIView {

    public let label = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 14), color: .black)
    public let subLabel = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 12), color: .white)
    public let view = IOComponent.createView(bgColor: .red)
    
    public override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func configure(){
        
        view.layer.cornerRadius = 10
        view.width(20).height(20)
        
        view.subviews {
            subLabel
        }
        
        subLabel.centerHorizontally().centerVertically()
        
        subviews {
            label
            view
        }
        
        layout {
            4
            |-20-label-4-view
            4
        }
        
    }
    
}
