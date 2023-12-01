//
//  PlanHeaderInfoTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanHeaderInfoTableViewCell: UITableViewCell {

    public static let cellIdentifier = "PlanHeaderInfoTableViewCell"

    public let label = IOComponent.createLabel(text: "Goa", font: .systemFont(ofSize: 22), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Some Next", font: .systemFont(ofSize: 12), color: .black)

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
        
        sublabel.numberOfLines = 0
        
        let div1 = IOComponent.createView(bgColor: UIColor(red: 208/255, green: 200/255, blue: 196/255, alpha: 1.0))
        div1.height(1)
        
        let div2 = IOComponent.createView(bgColor: UIColor(red: 208/255, green: 200/255, blue: 196/255, alpha: 1.0))
        div2.height(1)

//        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label, div1, sublabel, div2])
//        stackView.spacing = 10
//        stackView.alignment = .leading
//        
        label.height(26)
        
//        subviews {
//            stackView
//        }
//        
//        layout {
//            10
//            |-20-stackView-20-|
//            10
//        }
        
        subviews {
            label
            div1
            sublabel
            div2
        }
        
        layout {
            10
            |-20-label-20-| ~ 24
            10
            |-20-div1-20-| ~ 1
            10
            |-20-sublabel-20-| ~ 30
            10
            |-20-div1-20-| ~ 1
            10
        }
        
        sublabel.backgroundColor = .yellow
    }

}
