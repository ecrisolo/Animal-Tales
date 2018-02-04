//
//  TalesData.swift
//  Animal Tales
//
//  Created by Anita Souv on 2/4/18.
//  Copyright © 2018 Elizabeth Crisologo. All rights reserved.
//

import Foundation
import os
class TalesData: NSObject, NSCoding {
    
    struct PropertyKey {
        static let title = "title"
        static let description = "description"
        static let location = "location"
        static let picture = "picture"
        
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("talesDB")
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(description, forKey: PropertyKey.description)
        aCoder.encode(picture, forKey: PropertyKey.picture)
        aCoder.encode(picture, forKey: PropertyKey.location)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String else {
            os_log("Unable to decode the name for a Tale object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let description = aDecoder.decodeObject(forKey: PropertyKey.description) as? String;
        let picture = aDecoder.decodeObject(forKey: PropertyKey.picture) as? String;
        let location = aDecoder.decodeObject(forKey: PropertyKey.location) as? String;
        
        self.init(title: title, description: description!, picture: picture!, location: location!)
        
    }
    
    var title : String
//    var description: String
    var picture : String // name of file
    var location: String
    
    init(title: String , description: String, picture: String, location: String) {
        self.title = title;
//        self.description = description
        self.picture = picture
        self.location = location
    }
    
    func update(newTale: TalesData) {
        self.title = newTale.title;
//        self.description = newTale.description
        self.picture = newTale.picture
        self.location = newTale.location
    }
    
}
