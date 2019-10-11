//
//  UserViewController.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/10.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import Foundation
import UIKit

class UserContainerViewController: UIViewController{
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        setUserInfo()
    }
    
    func setUserInfo(){
        self.view.backgroundColor = UIColor(red: 8/255, green: 4/255, blue: 3/255, alpha: 0.3)
        userIcon.image = UIImage(named: "UserIcon")
        userName.text = "Masaru Sato"
    }
}
