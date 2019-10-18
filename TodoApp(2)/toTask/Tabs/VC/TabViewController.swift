//
//  TabViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/17.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    var selectedTag: Int?
    var selectedTag1Name: Int?
    var selectedTag2Name: Int?
    var selectedTag3Name: Int?
    
    @IBOutlet weak var tabView1: UIView!
    @IBOutlet weak var tabView2: UIView!
    @IBOutlet weak var tabView3: UIView!
    
    @IBOutlet weak var btnTab1: UIButton!
    @IBOutlet weak var btnTab2: UIButton!
    @IBOutlet weak var btnTab3: UIButton!
    
    @IBOutlet weak var imgTab1: UIImageView!
    @IBOutlet weak var imgTab2: UIImageView!
    @IBOutlet weak var imgTab3: UIImageView!
    
    @IBAction func back(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationView: UIViewController = storyboard.instantiateInitialViewController(){
            present(destinationView, animated: true, completion: nil)
        }
    }
    
    //タブ選択により、該当画面を表示
    @IBAction func selectTab(_ sender: Any) {
        let btn: UIButton = sender as! UIButton
        if btn.tag == 1{        //「タグ設定が」タップされた場合
            view.bringSubviewToFront(imgTab1)
            view.bringSubviewToFront(btnTab1)
            view.sendSubviewToBack(imgTab2)
            view.sendSubviewToBack(imgTab3)
            
            tabView1.isHidden = false
            tabView2.isHidden = true
            tabView3.isHidden = true
            
        }else if  btn.tag == 2{     //「出席確認」がタップされた場合
            
            //TODO: PickerViewの非表示
            
            view.bringSubviewToFront(imgTab2)
            view.bringSubviewToFront(btnTab2)
            view.sendSubviewToBack(imgTab1)
            view.sendSubviewToBack(imgTab3)
            
            tabView1.isHidden = true
            tabView2.isHidden = false
            tabView3.isHidden = true
            
        }else{      //「投書箱」がタップされたゔ場合
            
            //TODO: PickerViewの非表示
            
            view.bringSubviewToFront(imgTab3)
            view.bringSubviewToFront(btnTab3)
            view.sendSubviewToBack(imgTab1)
            view.sendSubviewToBack(imgTab2)
            
            tabView1.isHidden = true
            tabView2.isHidden = true
            tabView3.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
