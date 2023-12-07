//
//  PlanProfileTableViewCell.swift
//  
//
//  Created by Anand  on 30/11/23.
//

import UIKit
import PMP_Component
import Stevia

public class PlanProfileTableViewCell: UITableViewCell, TableViewCellSerializable {

    public static let cellIdentifier = "PlanProfileTableViewCell"

    public let label = IOComponent.createLabel(text: "Created By", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Private", font: .systemFont(ofSize: 12), color: .black)
    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let shareBtn = LeftAlignedIconButton()

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
                    
        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label,sublabel])
        stackView.spacing = 4
        stackView.alignment = .leading
        
        shareBtn.width(40).height(40)
        avatar.size(40)
        
        subviews {
            stackView
            avatar
            shareBtn
        }
        
        layout {
            10
            |-20-avatar-10-stackView-10-shareBtn-20-|
            10
        }
        
    }
    
}
