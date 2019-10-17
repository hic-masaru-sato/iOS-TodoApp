//
//  StudyViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/11.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class TodayViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var floatingActionButton: UIButton!
    @IBAction func buttonAction(_ sender: Any) {
        //タスク追加画面の表示
        let alertController = UIAlertController(title: "タスクを追加", message: "タスク名を入力してください", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        //タスク追加時の挙動
        let okAction = UIAlertAction(title: "add", style: .default){
            (action: UIAlertAction) in
            if let textField = alertController.textFields?.first{
                let todoData = TodoData()
                todoData.todoTitle = textField.text!
                self.tableViewController.todoList.insert(todoData, at: 0)
                self.tableViewController.todayTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
                
                //UDにデータを登録
                let userDefaults = UserDefaults.standard
                do{
                    let archivedData: Data = try NSKeyedArchiver.archivedData(withRootObject: self.tableViewController.todoList, requiringSecureCoding: false)
                    userDefaults.set(archivedData, forKey: "todoList")
                    userDefaults.synchronize()
                }catch{
                    fatalError()
                }
            }
        }
        
        //タスク追加キャンセル時の挙動
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    var tableViewController = TodayTableViewController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? TodayTableViewController {
            self.tableViewController = VC
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBar()
        createButton()
        
        //
        var todoList = tableViewController.todoList
        
        if let storedData = UserDefaults().data(forKey: "todoList"){
            do{
                let unarchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData)
                todoList.append(contentsOf: unarchivedData as! [TodoData])
            }catch{
                fatalError()
            }
        }
        
        tableViewController.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func createButton(){
        let buttonImage: UIImage = UIImage(named: "FloatingButton")!
        floatingActionButton.setImage(buttonImage, for: UIControl.State.normal)
        floatingActionButton.imageView?.contentMode = .scaleAspectFit
        floatingActionButton.contentHorizontalAlignment = .fill
        floatingActionButton.contentVerticalAlignment = .fill
        floatingActionButton.layer.cornerRadius = 70
        floatingActionButton.layer.masksToBounds = true
        floatingActionButton.layer.shadowColor = UIColor.black.cgColor
        floatingActionButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        floatingActionButton.layer.shadowOpacity = 0.4
        floatingActionButton.layer.shadowRadius = 4
    }
    
    func setSearchBar(){
        searchBar.placeholder = "検索キーワードを入力してください"
        searchBar.delegate = self
        self.view.addSubview(searchBar)
    }
    
    //Buttonのアニメーション設定
    func showActionButton(){
        floatingActionButton.isHidden = false
        floatingActionButton.center.y += 100
        UIView.animate(withDuration: 0.2, delay: 0.2, options: [.curveEaseOut], animations: {self.floatingActionButton.center.y -= 100}, completion: nil)
    }
    
    func hideActionButton(){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseIn], animations: {self.floatingActionButton.center.y += 100.0}) {
            _ in
            self.floatingActionButton.center.y -= 100.0
            self.floatingActionButton.isHidden = true
        }
    }
}
