//
//  File.swift
//  
//
//  Created by Anand  on 30/10/23.
//

import Foundation
import RNCryptor

public class PMPCrypto {
    
    public static let encryptKey = "PMPAnand"
    
    public class func encryptMessage(message: String, encryptionKey: String) throws -> String {
          let messageData = message.data(using: .utf8)!
          let cipherData = RNCryptor.encrypt(data: messageData, withPassword: encryptionKey)
          return cipherData.base64EncodedString()
      }

    public class func decryptMessage(encryptedMessage: String, encryptionKey: String) throws -> String {

          let encryptedData = Data.init(base64Encoded: encryptedMessage)!
          let decryptedData = try RNCryptor.decrypt(data: encryptedData, withPassword: encryptionKey)
          let decryptedString = String(data: decryptedData, encoding: .utf8)!

          return decryptedString
      }
}
