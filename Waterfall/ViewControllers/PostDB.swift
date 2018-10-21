//
//  PostDB.swift
//  
//
//  Created by Cheyenne Martinez on 10/20/18.
//

import Foundation
import MongoSwift

// initialize global state
MongoSwift.initialize()

let client = try MongoClient(connectionString: "mongodb://localhost:27017")
let db = try client.db("myDB")
let collection = try db.createCollection("myCollection")

// free all resources
MongoSwift.cleanup()
