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
    
    @IBOutlet weak var todoText: UILabel!
    
    override func viewDidLoad() {
        todoText.layer.borderWidth = 1.0
    }
}
