//
//  TodoItem.swift
//  todo
//
//  Created by Ehidiamen Ojielu on 6/5/20.
//  Copyright © 2020 ehis. All rights reserved.
//

import Foundation

enum Priority {
    case high
    case medium
    case low
}

struct TodoItem {
    var title: String
    var createdAt: Date
    var modifiedAt: Date
    var priority: Priority = .low
}
