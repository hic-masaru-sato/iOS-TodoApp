//
//  TodayTableViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/16.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class TodayTableViewController: UITableViewController {
    
    var todoList = [TodoData]()

    @IBOutlet var todayTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCell", for: indexPath) as! TodayTableViewCell
        let todoData = todoList[indexPath.row]
        cell.textView.text = todoData.todoTitle

        return cell
    }
    
    //UDからデータを削除
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let userDrfaults = UserDefaults.standard
            do{
                let data: Data = try NSKeyedArchiver.archivedData(withRootObject: self.todoList, requiringSecureCoding: false)
                userDrfaults.set(data, forKey: "todoList")
                userDrfaults.synchronize()
            }catch{
                fatalError()
            }
        }
    }
    
    // MARK: - Individual Function
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("スクロール開始")
        (parent as! TodayViewController).hideActionButton()
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("スクロール終了")
        (parent as! TodayViewController).showActionButton()
    }

}
