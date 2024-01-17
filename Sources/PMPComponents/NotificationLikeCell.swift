//
//  NotificationLikeCell.swift
//  
//
//  Created by Anand  on 17/01/24.
//

import UIKit
import PMP_Component
import Stevia

public class NotificationLikeCell: UITableViewCell {

    public static let cellIdentifier = "NotificationLikeCell"
    
    public let avatar = IOComponent.createImageView(radius: 20, bgColor: .red)
    public let label = IOComponent.createLabel(text: "Shrinath wants to Follow with you", font: .systemFont(ofSize: 14), color: .black)
    public let sublabel = IOComponent.createLabel(text: "10 mins ago", font: .systemFont(ofSize: 12), color: .black)
    public let feedImage = IOComponent.createImageView(radius: 0, bgColor: .white)

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
            feedImage
        }
                
        layout {
            16
            |-20-avatar-10-stackView-feedImage-20-|
            16
        }
    
    }

}
