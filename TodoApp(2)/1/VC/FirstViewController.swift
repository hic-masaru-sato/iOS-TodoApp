//
//  ViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/09.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = FirstDataSource()
    private var group: [Group] = [
    Group(id: 1, name: "インボックス", category: .toTask),
    Group(id: 2, name: "今日", category: .toTask),
    Group(id: 3, name: "次の７日間", category: .toTask),
    Group(id: 4, name: "ワーク", category: .project),
    Group(id: 5, name: "スタディ", category: .project),
    Group(id: 6, name: "＠保留中", category: .label),
    Group(id: 7, name: "＠メール", category: .label),
    Group(id: 8, name: "プロパティ１", category: .filter),
    Group(id: 9, name: "プロパティ2", category: .filter),
    Group(id: 10, name: "プロパティ3", category: .filter)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        
        configure(tableView)
        dataSource.load(group)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目の行が選択されました")
        print("\(indexPath.section)番目のセクションが選択されました")
        
        let array: [[String]] = []
        let view = View(array)
        NSLog((view[indexPath.section - 1][indexPath.row]))
        
        tableView.isExclusiveTouch = true
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        //画面遷移
        self.performSegue(withIdentifier: (view[indexPath.section - 1][indexPath.row]), sender: nil)
        
    }
    
    private func configure(_ tableView: UITableView){
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView(frame: .zero)
    }

}

