//
//  TaskTableViewCell.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/11.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setCell(){
        
    }
    
}
