//
//  InboxViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class InboxViewController: UIViewController{
    
    var tableVC: TaskContainerViewController!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? TaskContainerViewController {
            self.tableVC = VC
        }
    }
    
    @IBOutlet weak var todoText: UILabel!

    @IBAction func addButton(_ sender: Any) {
    let alertController = UIAlertController(title: "タスクを追加", message: "タスク名を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        //Alert：OKボタン押下時の処理
        let okAction = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction) in
            if let textField = alertController.textFields?.first{
                let todoData = TodoData()
                todoData.todoTitle = textField.text!
                self.tableVC.todoList.insert(todoData, at: 0)
                for x in self.tableVC.todoList{
                    print(x.todoTitle!)
                }
                self.tableVC.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
                
                let userDefaults = UserDefaults.standard
                do{
                    //UDにデータを登録、更新
                    let archivedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self.tableVC.todoList, requiringSecureCoding: false)
                    userDefaults.set(archivedData, forKey: "todoList")
                    userDefaults.synchronize()
                    
                }catch{
                    fatalError()
                }
            }
        }
        //Alert：キャンセルボタン押下時の処理
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        tableVC.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        todoText.layer.borderWidth = 1.0
        
    }
    
}
    
    
    

