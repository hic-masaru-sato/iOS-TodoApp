//
//  InboxViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class InboxViewController: UIViewController, UITableViewDataSource{
    
    var todoList = [TodoData]()
    let tableView = TaskContainerViewController()
    
    
    @IBOutlet weak var todoText: UILabel!
    @IBAction func addButton(_ sender: Any) {
        let alertController = UIAlertController(title: "タスクを追加", message: "タスク名を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction) in
            if let textField = alertController.textFields?.first{
                let todoData = TodoData()
                todoData.todoTitle = textField.text!
                self.todoList.insert(todoData, at: 0)
                
                self.tableView.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
                
                let userDefaults = UserDefaults.standard
                do{
                    let archivedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self.todoList, requiringSecureCoding: false)
                    userDefaults.set(archivedData, forKey: "todoList")
                    userDefaults.synchronize()
                    
                }catch{
                    fatalError()
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        todoText.layer.borderWidth = 1.0
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
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
    
    
    

