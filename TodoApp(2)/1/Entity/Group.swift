//
//  Group.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation

public struct Group{
    let id: Int
    let name: String
    let category: Category
}

enum Category: String, CaseIterable{
    case toTask, project, label, filter
}
