//
//  ChatListCell.swift
//  PenMyPlan
//
//  Created by Anand  on 16/10/23.
//  Copyright © 2023 PenMyPlan. All rights reserved.
//

import UIKit
import Stevia
import PMP_Component

public class ChatListCell: UITableViewCell {
    
    public static let cellIdentifier = "ChatListCell"
    
    private let chatStack = IOComponent.createStackView(axisType: .horizontal, list: [])
    private lazy var chatView = IOComponent.createView(radius: 0, bgColor: UIColor.white)
    public lazy var checkMarkButton = IOComponent.createButtonWith(bgColor: .clear)
    
    private let chatLabel = IOComponent.createLabel(
        text: "One - One",
        font: UIFont.systemFont(ofSize: 18),
        color: UIColor(red: 0.14, green: 0.15, blue: 0.24, alpha: 1))
    
    private let messageLabel = IOComponent.createLabel(
        text: "Message Send here",
        font: UIFont.systemFont(ofSize: 14),
        color: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5))
    
    private let unreadCountLabel = IOComponent.createLabel(text: "1", font: .systemFont(ofSize: 11), color: .white)
    
    private let timeLabel = IOComponent.createLabel(
        text: "12 min ago",
        font: .systemFont(ofSize: 10),
        color: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
    )

    private let senderLabel = IOComponent.createLabel(text: "Anand Kumar", font: .systemFont(ofSize: 16), color: .black)

    private let emptyText = IOComponent.createLabel(text: "  It's time to started conversation.  ", font: UIFont.systemFont(ofSize: 10), color: .black)
    
    private let avatar = Avatar()
    
    public var placeHolderName: String = ""
    

    public var isChatSelected = false {
        didSet {
            checkMarkButton.isHidden = !isChatSelected
        }
    }
    
    public var timeAgo: String = "" {
        didSet {
            timeLabel.text = timeAgo
        }
    }
    
    public var isTextEmpty: Bool = false {
        didSet {
            emptyText.isHidden = !isTextEmpty
            messageLabel.isHidden = isTextEmpty
        }
    }
    
    public var senderName: String = "" {
        didSet {
            senderLabel.text = senderName
        }
    }
    
    public var senderFont: UIFont? {
        didSet {
            senderLabel.font = senderFont
        }
    }
    
    public var senderColor: UIColor? {
        didSet {
            senderLabel.textColor = senderColor
        }
    }
    
    public var imagesUrl: [URL?] = [] {
        didSet {
            avatar.configure(imagesUrl, size: 50, placeholder: placeHolderName)
        }
    }
    
    public var unreadText: String = "" {
        didSet {
            unreadCountLabel.text = unreadText
        }
    }
    
    public var unreadHidden: Bool = false {
        didSet {
            unreadCountLabel.isHidden = unreadHidden
        }
    }
    
    public var messageText: String = "" {
        didSet {
            messageLabel.text = messageText
        }
    }
    
    public var messageFont: UIFont? {
        didSet {
            messageLabel.font = messageFont
        }
    }
    
    public var messageColor: UIColor? {
        didSet {
            messageLabel.textColor = messageColor
        }
    }
    
    public var chatTitleFont: UIFont? {
        didSet {
            chatLabel.font = chatTitleFont
        }
    }
    
    public var chatTitleColor: UIColor? {
        didSet {
            chatLabel.textColor = chatTitleColor
        }
    }
    
    public var chatText: String = "" {
        didSet {
            chatLabel.text = chatText
        }
    }

    public var image: UIImage? {
        didSet {
            checkMarkButton.setImage(image, for: .normal)
        }
    }
    
    public var selectedImage: UIImage? {
        didSet {
            checkMarkButton.setImage(selectedImage, for: .selected)
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        render()
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
       
        self.backgroundColor = .clear
        selectionStyle = .none
       
       unreadHidden = true
       
       emptyText.backgroundColor = #colorLiteral(red: 0.8626816273, green: 0.8626816273, blue: 0.8626816273, alpha: 1)
       
       unreadCountLabel.width(20).height(20)
       unreadCountLabel.layer.cornerRadius = 10
       unreadCountLabel.clipsToBounds = true
       
       unreadCountLabel.backgroundColor =  UIColor(red: 0.89, green: 0.52, blue: 0.06, alpha: 0.5)
       unreadCountLabel.isHidden = true
       unreadCountLabel.textAlignment = .center
        
      checkMarkButton.width(40).height(40)
       
       let chatContainer = IOComponent.createView(bgColor: .white)
       chatContainer.layer.cornerRadius = 12
       chatContainer.PMPDropShadow(color: .black, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

       chatContainer.clipsToBounds = true
       
       chatContainer.subviews {
           avatar
           chatView
       }
       
       chatContainer.layout(
           |-avatar.size(50).centerVertically()-10-chatView.top(0).bottom(0)|
       )
       
       chatStack.addArrangedSubview(checkMarkButton)
       chatStack.addArrangedSubview(chatContainer)
       chatStack.spacing = 10
       chatStack.distribution = .fill

       let senderStack = UIStackView(arrangedSubviews: [senderLabel, emptyText.height(18)])
       senderStack.axis = .horizontal
       
       chatView.subviews {
           chatLabel
           messageLabel
           timeLabel
           unreadCountLabel
           senderStack
       }
       
      
       chatView.layout {
           8
           |chatLabel-""-timeLabel-14-|
           2
           |senderStack-(>=35)-|
           2
           |messageLabel-(>=35)-|
           10
       }
    
        subviews {
            chatStack
        }
        
        layout {
            10
            |-0-chatStack-10-|
            10
        }
       
       align(rights: timeLabel, unreadCountLabel)
       
       unreadCountLabel.Top == timeLabel.Bottom + 4
       unreadCountLabel.isHidden = true

    }
    
}
