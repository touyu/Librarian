//
//  TitleAndTextTableViewCell.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/27.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit

class TitleAndTextTableViewCell: UITableViewCell {
    
    @IBOutlet dynamic private weak var titleLabel: UILabel!
    @IBOutlet dynamic private weak var detailLabel: UILabel!
    
    func set(title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }

}
