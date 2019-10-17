//
//  TodayTodoData.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/16.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation

class TodayTodoData: NSObject, NSCoding{
    
    var todoTitle: String?
    var todoDone: Bool = false
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(todoTitle, forKey: "todoTitle")
        aCoder.encode(todoDone, forKey: "todoDone")
    }
    
    required init?(coder aDecoder: NSCoder) {
        todoTitle = aDecoder.decodeObject(forKey: "todoTitle") as? String
        todoDone = aDecoder.decodeBool(forKey: "todoDone")
    }
    
}
