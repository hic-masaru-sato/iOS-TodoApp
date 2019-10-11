//
//  FirstDataSource.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class FirstDataSource: NSObject, UITableViewDataSource{
    
    var groups: [Group] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 0
        case 1:
            return groups.filter{$0.category == .toTask}.count
        case 2:
            return groups.filter{$0.category == .project}.count
        case 3:
            return groups.filter{$0.category == .label}.count
        case 4:
            return groups.filter{$0.category == .filter}.count
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
            let toTaskGroup = groups.filter{$0.category == .toTask}[indexPath.row]
            cell.configure(with: toTaskGroup)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
            let projectGroup = groups.filter{$0.category == .project}[indexPath.row]
            cell.configure(with: projectGroup)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
            let labelGroup = groups.filter{$0.category == .label}[indexPath.row]
            cell.configure(with: labelGroup)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell") as! GroupTableViewCell
            let filterGroup = groups.filter{$0.category == .filter}[indexPath.row]
            cell.configure(with: filterGroup)
            return cell
            
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return nil
        case 2:
            return Category.project.rawValue
        case 3:
            return Category.label.rawValue
        case 4:
            return Category.filter.rawValue
        default:
            fatalError()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count + 1 //WARNING: actually this pluses 1
    }
    
    func load(_ groups: [Group]){
        self.groups = groups
    }
    
}
