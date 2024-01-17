//
//  NotificationRequestsCell.swift
//  
//
//  Created by Anand  on 17/01/24.
//

import UIKit
import PMP_Component
import Stevia

public class NotificationRequestsCell: UITableViewCell {
    
    public static let cellIdentifier = "NotificationRequestsCell"

    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let label = IOComponent.createLabel(text: "Following Requests", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "Approve or Ignore requests", font: .systemFont(ofSize: 12), color: .black)
    public let badgeLabel = IOComponent.createLabel(text: "01", font: .systemFont(ofSize: 12), color: .lightGray)


    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        overrideCellUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
        overrideCellUI()
    }
 
    private func render() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label, sublabel])
        stackView.spacing = 4
    
        avatar.subviews {
            badgeLabel
        }
        badgeLabel.size(30).layer.cornerRadius = 15
        badgeLabel.top(2).right(-10)
        subviews {
            avatar
            stackView
        }
        
        layout {
            16
            |-20-avatar-10-stackView-20-|
            16
        }
        
    }

}
