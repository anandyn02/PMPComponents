//
//  PlanHeaderInfoTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanHeaderInfoTableViewCell: UITableViewCell, TableViewCellSerializable {

    public static let cellIdentifier = "PlanHeaderInfoTableViewCell"

    public let label = IOComponent.createLabel(text: "Goa", font: .systemFont(ofSize: 22), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Some Next", font: .systemFont(ofSize: 12), color: .black)
    
    public let div2 = IOComponent.createLabel(text: "", font: .systemFont(ofSize: 1), color: UIColor(red: 208/255, green: 200/255, blue: 196/255, alpha: 0.5))

    public  let div1 = IOComponent.createImageView(radius: 0, bgColor: UIColor(red: 208/255, green: 200/255, blue: 196/255, alpha: 1.0))
    
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
        
        updateViewObjects()
        sublabel.numberOfLines = 0
        
        div1.height(1)
        let width = UIScreen.main.bounds.width
        div2.height(1).width(width - 40)

        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label, div2, sublabel])
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        label.numberOfLines = 0
        //label.height(26)
        
        subviews {
            stackView
            div1
        }
        
        layout {
            10
            |-20-stackView-20-|
            10
            |-20-div1-20-|
            10
        }
        
//        subviews {
//            label
//            div1
//            sublabel
//            div2
//        }
//        
//        layout {
//            10
//            |-20-label-20-| ~ 24
//            10
//            |-20-div1-20-| ~ 1
//            10
//            |-20-sublabel-20-| //~ 30
//            10
//            |-20-div2-20-| ~ 1
//            10
//        }
        
    }
    
}
