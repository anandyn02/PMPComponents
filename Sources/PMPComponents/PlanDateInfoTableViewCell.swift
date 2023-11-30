//
//  PlanDateInfoTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanDateInfoTableViewCell: UITableViewCell {

    public static let cellIdentifier = "PlanDateInfoTableViewCell"

    public let label = IOComponent.createLabel(text: "Which date/s is this happening?", font: .systemFont(ofSize: 14), color: .black)
    public let avatar = IOComponent.createImageView(radius: 0, bgColor: .white)
    public let dateLabel = IOComponent.createLabel(text: "Goa", font: .systemFont(ofSize: 14), color: .black)
    public let numberOfDaysLabel = IOComponent.createLabel(text: "Goa", font: .systemFont(ofSize: 14), color: .black)

    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        
        let contentView = IOComponent.createView(bgColor: .white)
        contentView.layer.cornerRadius = 8
        
        let stack = IOComponent.createStackView(axisType: .vertical, list: [dateLabel, numberOfDaysLabel])
        stack.spacing = 10
        
        let div2 = IOComponent.createView(bgColor: UIColor(red: 208/255, green: 200/255, blue: 196/255, alpha: 1.0))
        div2.height(1)
        
        avatar.size(40)
        
        contentView.subviews {
            avatar
            stack
            div2
        }
        
        avatar.left(10).centerVertically()
        stack.left(50).centerVertically().right(10)

        subviews {
            label
            contentView
        }
        
        layout {
            10
            |-20-label-20-|
            10
            |-20-contentView-20-| ~ 72
            10
            |-20-div2-20-|
            0
        }
        
        
    }

}
