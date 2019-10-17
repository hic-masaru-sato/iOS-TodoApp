//
//  CheckBox.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/16.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    //Images
    let checkedImage = UIImage(named: "checked")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked")! as UIImage
    
    //Bool Property
    var isChecked: Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, for: UIControl.State.normal)
            }else{
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton){
        
    }
    
    func setChecked(_ check: Bool){
        isChecked = check
    }
    
}
