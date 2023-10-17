//
//  File.swift
//  
//
//  Created by Anand  on 17/10/23.
//

import UIKit
import Stevia
import PMP_Component

public class SelectContactCell: UITableViewCell {
    
    public static let cellIdentifier = "SelectContactCell"

   public let label = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 12), color: .black)
   public let checkMark = IOComponent.createButton(text: "", titleColor: .clear, bgColor: .clear)
   public let avatar = Avatar()
    
    private let containerView = IOComponent.createView(radius: 8,bgColor: .lightGray)
    
    public var containerColor: UIColor? {
        didSet {
            containerView.backgroundColor = containerColor
        }
    }
    
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
        
        subviews {
            containerView
        }
        
        layout {
            2
            |-10-containerView-10-|
            2
        }
        containerView.subviews(avatar, label, checkMark)
        
        containerView.layout(
            5,
            |-20-avatar-10-label-10-checkMark-20-|,
            5
        )
    }
    

}
