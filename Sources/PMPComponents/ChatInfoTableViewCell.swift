//
//  ChatInfoTableViewCell.swift
//  
//
//  Created by Anand  on 22/10/23.
//

import UIKit
import PMP_Component
import Stevia

public class ChatInfoTableViewCell: UITableViewCell {

    public static let cellIdentifier = "ChatInfoTableViewCell"
    
    public let label = IOComponent.createLabel(text: "Media", font: .systemFont(ofSize: 14), color: .black)
    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let containtView = IOComponent.createView(bgColor: .yellow)

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
       // fatalError("init(coder:) has not been implemented")
    }
 
    private func render() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let div = IOComponent.createView(bgColor: UIColor(red: 201/255, green: 197/255, blue: 202/255, alpha: 1.0))
        
        containtView.height(72)
        avatar.width(40).height(40)
        
        containtView.subviews {
            avatar
            label
            div
        }
        
        containtView.layout {
            16
            |-20-avatar-10-label
            15
            |-40-div-20-|
        }
        
        subviews {
            containtView
        }
        
        layout {
            0
            |-20-containtView-20-|
            0
        }
        
    }
    

}
