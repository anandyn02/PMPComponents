//
//  PlanLocationTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanLocationTableViewCell: UITableViewCell {

    public static let cellIdentifier = "PlanLocationTableViewCell"

    public let label = IOComponent.createLabel(text: "Location", font: .systemFont(ofSize: 22), color: .black)
    public let stack = IOComponent.createStackView(axisType: .vertical, list: [])
    

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
        
        subviews {
            label
            stack
        }
        
        layout {
            10
            |-20-label-20-| ~ 22
            10
            |-20-stack-20-|
            10
        }
        
    }

}


public class PlanLocationView: UIView {
    
    public let imageview = IOComponent.createImageView(radius: 0, bgColor: .clear)
    public let label = IOComponent.createLabel(text: "Location", font: .systemFont(ofSize: 14), color: .black)
    
    public override init(frame: CGRect) {
         super.init(frame: frame)
         configure()
     }
    
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    
    func configure(){
        
        imageview.size(20)
        
        subviews {
            imageview
            label
        }
        
        layout {
            4
            |-10-imageview-10-label-10-|
            4
        }
    }
    
}
