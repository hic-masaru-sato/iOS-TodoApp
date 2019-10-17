//
//  TodayTableViewCell.swift
//  TodoApp(2)
//
//  Created by MasaruSato on 2019/10/16.
//  Copyright © 2019 MasaruSato. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: CheckBox!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
