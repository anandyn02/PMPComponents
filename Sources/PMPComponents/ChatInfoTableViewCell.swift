//
//  ChatInfoTableViewCell.swift
//  
//
//  Created by Anand  on 22/10/23.
//

import UIKit
import PMP_Component
import Stevia

public enum ChatInfoCellType {
    case none
    case textAccessoryIcon
    case accessoryIcon
    case cancelAccessoryIcon
    case cancelIcon
}

public class ChatInfoTableViewCell: UITableViewCell {
    
    public static let cellIdentifier = "ChatInfoTableViewCell"
    
    public let label = IOComponent.createLabel(text: "Media", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Media", font: .systemFont(ofSize: 12), color: .black)

    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let containtView = IOComponent.createView(bgColor: .yellow)
    public let div = IOComponent.createView(bgColor: UIColor(red: 201/255, green: 197/255, blue: 202/255, alpha: 1.0))
    
    public lazy var accessoryLabel = IOComponent.createLabel(text: "Media", font: .systemFont(ofSize: 12), color: .lightGray)
    public lazy var accessoryImage = IOComponent.createImageView(radius: 0, bgColor: .red)
    
    private lazy var acessoryStack = IOComponent.createStackView(axisType: .horizontal, list: [accessoryLabel, accessoryImage])
    
    private lazy var titleStack = IOComponent.createStackView(axisType: .vertical, list: [label, sublabel])
    
    public var cellType: ChatInfoCellType = .none {
        didSet {
            
            acessoryStack.isHidden = false

            switch cellType {
            case .none:
                acessoryStack.isHidden = true
                
            case .textAccessoryIcon, .cancelAccessoryIcon:
                accessoryLabel.isHidden = false
                accessoryImage.isHidden = false
                
            case .accessoryIcon, .cancelIcon:
                accessoryLabel.isHidden = true
                accessoryImage.isHidden = false
            }
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
        
        accessoryImage.backgroundColor = .clear
        accessoryImage.width(30).height(30)
        accessoryLabel.width(40)
        
        acessoryStack.alignment = .trailing
        
        containtView.height(72)
        avatar.width(40).height(40)
        div.height(1)
        
        titleStack.spacing = 2
        
        containtView.subviews {
            avatar
            titleStack
            acessoryStack
            div
        }
        
        containtView.layout {
            16
            |-20-avatar-10-titleStack-""-acessoryStack-20-|
            15
            |-60-div-20-|
            1
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
