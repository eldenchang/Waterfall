//
//  Task.swift
//  Waterfall
//
//  Created by Qifan Chang on 10/20/18.
//  Copyright © 2018 boilermake6. All rights reserved.
//

import UIKit
import StitchCore


struct Task : Equatable{
    
    //Mark: setup Keys for MongDB
    struct Keys {
        static let TaskIDKey = "_id"
        static let TaskTextKey = "text"
        static let tRankKey = "t_rank"
        static let dueDateKey = "due_date"
        static let eTimeKey = "e_time"
        static let ImportanceKey = "importance"
        static let CheckedKey = "checked"
    }
    
    //Mark: Fields of Task object
    let TaskID : ObjectId
    var TaskText : String
    var tRank : Int
    var dueDate : NSDate
    var eTime : TimeInterval
    var Importance : Int
    var Checked : Bool
    
    init?(document: Document) {
        
        guard let TaskID = document[Keys.TaskIDKey] as? ObjectId else {return nil}
        TaskText = document[Keys.TaskTextKey] as! String
        tRank = document[Keys.tRankKey] as! Int
        dueDate = document[Keys.dueDateKey] as! NSDate
        eTime = document[Keys.eTimeKey] as! TimeInterval
        Importance = document[Keys.ImportanceKey] as! Int
        
        self.TaskID = TaskID
//        self.TaskText = TaskText
//        self.tRank = tRank
        
        
        self.Checked = document[Keys.CheckedKey] as? Bool ?? false
    }

    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.TaskID.oid == rhs.TaskID.oid
    }
}
