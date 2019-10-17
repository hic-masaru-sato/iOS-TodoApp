//
//  View.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation

public func View(_ array: [[String]]) -> [[String]]{

var ary = array
    
ary.append(["showInbox", "showToday", "showWeek"])
ary.append(["showWork", "showStudy"])
ary.append(["showFornow", "showMail"])
ary.append(["showProperty1", "showProperty2", "showProperty3"])

return ary
}


