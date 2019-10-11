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
//enum View: Int{
//    case inbox
//    case today
//    case week
//    case work
//    case study
//    case fornow
//    case mail
//    case property1
//    case property2
//    case property3
//
//    var segueIdentifier: String{
//        switch self {
//        case .inbox:
//            return "InboxViewController"
//        case .today:
//            return "TodayViewController"
//        case .week:
//            return "WeekViewController"
//        case .work:
//            return "WorkViewController"
//        case .study:
//            return "StudyViewController"
//        case .fornow:
//            return "FornowViewController"
//        case .mail:
//            return "MailViewController"
//        case .property1:
//            return "Property1ViewController"
//        case .property2:
//            return "Property2ViewController"
//        case .property3:
//            return "Property3ViewController"
//        }
//    }
//}


