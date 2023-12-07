//
//  PlanMapTableViewCell.swift
//  
//
//  Created by Anand  on 07/12/23.
//

import UIKit
import Stevia
import MapKit

public class PlanMapTableViewCell: UITableViewCell {
    
    public static let cellIdentifier = "PlanMapTableViewCell"

    public var map = MKMapView()
    public let container = UIView()

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
        
        map.layer.cornerRadius = 8
        map.isUserInteractionEnabled = false
        
        subviews(container.subviews(map))
        map.height(200).fillContainer()
        container.top(15).left(20).right(20).bottom(5)
    }
}
