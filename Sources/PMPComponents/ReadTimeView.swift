//
//  ReadTimeView.swift
//  PenMyPlan
//
//  Created by Anand  on 13/10/23.
//  Copyright © 2023 PenMyPlan. All rights reserved.
//

import UIKit
import PMP_Component
import Stevia

public class ReadTimeView: UIView {

    private lazy var postImageView: UIImageView = {
        let imageView = IOComponent.createImageView(radius: 0, bgColor: .clear)
        imageView.width(18)
        imageView.height(18)
        return imageView
    }()
    
    private lazy var readLbl = IOComponent.createLabel(text: "Read Time", font: UIFont.systemFont(ofSize: 12), color: .black)
    
    
   public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var readFont: UIFont? {
        didSet {
            readLbl.font = readFont
        }
    }
    
    public var readColor: UIColor? {
        didSet {
            readLbl.textColor = readColor
        }
    }
    public var readText: String = "" {
        didSet {
            readLbl.text = readText
        }
    }
    
   public var readIcon: UIImage? {
        didSet {
            postImageView.image = readIcon
        }
    }
    
    func configure(){
        
        readLbl.text = "Read Time: 2 mins"
       // postImageView.image = UIImage(named: "eye_new")
        
        self.subviews {
            postImageView
            readLbl
        }
        self.layout {
            10
            |-10-postImageView-10-readLbl-10-|
            10
        }
        
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor(red: 49.0/255.0, green: 48.0/255.0, blue: 51.0/255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
    }

}
