//
//  NotificationFollowCell.swift
//  
//
//  Created by Anand  on 17/01/24.
//

import UIKit
import PMP_Component
import Stevia

public class NotificationFollowCell: UITableViewCell {

    public static let cellIdentifier = "NotificationFollowCell"
    
    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let label = IOComponent.createLabel(text: "Shrinath wants to Follow with you", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "10 mins ago", font: .systemFont(ofSize: 12), color: .black)
    public let followButton = IOComponent.createButton(text: "Follow", titleColor: .clear, bgColor: .clear)
    public let deleteButton = IOComponent.createButton(text: "Follow", titleColor: .clear, bgColor: .clear)

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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
       // fatalError("init(coder:) has not been implemented")
    }
 
    private func render() {
        selectionStyle = .none
        backgroundColor = .clear
        
        let stackView = IOComponent.createStackView(axisType: .vertical, list: [label, sublabel])
        stackView.spacing = 4

        subviews {
            avatar
            stackView
            followButton
            deleteButton
        }
        
        deleteButton.top(10).right(10)
        
        layout {
            16
            |-20-avatar-10-stackView-followButton-20-|
            16
        }
    
    }

    func updateUI() {
        
    }
}
