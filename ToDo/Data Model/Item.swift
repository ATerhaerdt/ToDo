//
//  Item.swift
//  ToDo
//
//  Created by Adam Terhaerdt on 7/7/19.
//  Copyright © 2019 Adam Terhaerdt. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
