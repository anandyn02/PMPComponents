//
//  PlanProfileTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanProfileTableViewCell: UITableViewCell {

    public static let cellIdentifier = "PlanProfileTableViewCell"

    public let label = IOComponent.createLabel(text: "Created By", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Private", font: .systemFont(ofSize: 12), color: .black)
    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)

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
        
        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label,sublabel])
        stackView.spacing = 10
        avatar.size(40)
        
        subviews {
            stackView
            avatar
        }
        
        layout {
            10
            |-20-avatar-10-stackView-20-|
            10
        }
        
    }

}
