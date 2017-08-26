//
//  BookTableViewCell.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/26.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    var book: Book?
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        titleLabel.text = ""
//        authorLabel.text = ""
//        publisherLabel.text = ""
//    }
    
    func set(book: Book) {
        self.book = book
        
        titleLabel.text = book.title
        authorLabel.text = book.author
        publisherLabel.text = book.publisher
        if let imageURL = book.imageURL {
            bookImageView.set(url: URL(string: imageURL))
        }
    }
}
