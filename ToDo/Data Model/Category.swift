//
//  Category.swift
//  ToDo
//
//  Created by Adam Terhaerdt on 7/7/19.
//  Copyright © 2019 Adam Terhaerdt. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
