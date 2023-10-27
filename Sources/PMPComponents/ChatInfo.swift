//
//  File.swift
//  
//
//  Created by Anand  on 22/10/23.
//

import Foundation

public struct ChatInfo: Equatable {
    public var type: ChatInfoCellType = .none
    public var imageName: String?
    public var imageUrl: String?
    public var infoId: String?
    public var name: String?
    public var subName: String?
    
    public var accessoryImage: String?
    public var accessoryText: String?
    
    public static func == (lhs: ChatInfo, rhs: ChatInfo) -> Bool {
        lhs.infoId == rhs.infoId
    }
    
    public init(type: ChatInfoCellType, imageName: String?, imageUrl: String?, userId: String?, name: String?, subName: String?, accImage: String?, accText: String?){
        self.type = type
        self.imageName = imageName
        self.imageUrl = imageUrl
        self.infoId = userId
        self.name = name
        self.subName = subName
        self.accessoryImage = accImage
        self.accessoryText = accText
        
    }
}
