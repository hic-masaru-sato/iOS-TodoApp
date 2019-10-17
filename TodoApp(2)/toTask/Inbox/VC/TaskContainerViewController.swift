//
//  TaskContainerViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/11.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class TaskContainerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var todoList = [TodoData]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        //UDのデータ取り出し
        if let storedData = UserDefaults().data(forKey: "todoList"){
            do{
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData)
                todoList.append(contentsOf: unarchivedData as! [TodoData])
            }catch{
                fatalError()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todoData = todoList[indexPath.row]
        
        cell.textLabel?.text = todoData.todoTitle
        if todoData.todoDone{
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }else{
            cell.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let userDefalults = UserDefaults.standard
            do {
                let data: Data = try NSKeyedArchiver.archivedData(withRootObject: self.todoList, requiringSecureCoding: false)
                userDefalults.set(data, forKey: "todoList")
                userDefalults.synchronize()
            } catch {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoData = todoList[indexPath.row]
        if todoData.todoDone {
            todoData.todoDone = false
        } else {
            todoData.todoDone = true
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
        
        let userDefaults = UserDefaults.standard
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.todoList, requiringSecureCoding: false)
            userDefaults.set(data, forKey: "todoList")
            userDefaults.synchronize()
        } catch {
            print(error)
        }
    }
}
