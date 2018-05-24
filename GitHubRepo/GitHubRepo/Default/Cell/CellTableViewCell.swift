//
//  CellTableViewCell.swift
//  GitHubRepo
//
//  Created by Пользователь on 23.05.2018.
//  Copyright © 2018 Abramenko. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLoginLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
