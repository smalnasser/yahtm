//
//  Party.swift
//  Yahtam
//
//  Created by sarah alnasser on 24/07/1444 AH.
//

import Foundation
import UIKit
import SwiftUI

struct Party: Identifiable {
    let id = UUID().uuidString
    //let recordId: CKRecord.ID?
    var PartyName: String
    var Description : String
    var ContactEmail : String
    var  ContactNum: String
   // var Pic : Image
    var Pic : String
  

   // init(recordId: CKRecord.ID? = nil, title: String, writer: String, describtion: String, content: String, num_of_comments: Int,  date : Date = Date())
    init( partyName : String, description: String, contactEmail: String, contactNum: String, pic: String)// pic: Image)
    {
        
        self.PartyName = partyName
        self.Description = description
        self.ContactEmail = contactEmail
        self.ContactNum = contactNum
        self.Pic = pic
        // self.recordId = recordId
        
    }
    
//        init(record:CKRecord){
//            self.recordId  = record.recordID
//            self.title = record["title"] as? String ?? "N/A"
//            self.writer  = record["writer"] as? String ?? "N/A"
//            self.describtion    = record["describtion"] as? String ?? "N/A"
//            self.content    = record["content"] as? String ?? "N/A"
//            self.num_of_comments  = record["num_of_comments"] as? Int ?? 0
//            self.date  = record["date"] as? Date ?? Date()
//        }
    
    func toDictionary() -> [String: Any] {
        return ["PartyName": PartyName, "Description": Description, "ContactEmail": ContactEmail, "ContactNum": ContactNum, "Pic": Pic]
    }
}



