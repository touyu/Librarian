//
//  Book.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/26.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import Foundation

struct Book {
    var id: Int!
    var title: String = ""
    var author: String = ""
    var publisher: String = ""
    var imageURL: String?
    var isbn = ""
    var price = 0
    var memo = ""
    var status: BookStatus = .unread
    
    static func createForTest(id: Int = 0) -> Book {
        return Book(id: id,
                    title: "Swift実践入門",
                    author: "石川洋資/西山勇世",
                    publisher: "技術評論社",
                    imageURL: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/7303/9784774187303.jpg?_ex=200x200",
                    isbn: "9784774187303",
                    price: 420,
                    memo: "先進的な機能を駆使した簡潔でバグのないコード。Ｘｃｏｄｅで動かしながら学ぶ基本、設計指針、実装パターン。",
                    status: .read)
    }
}

enum BookStatus: String {
    case read = "既読"
    case unread = "積読"
    case wannaWatch = "読みたい"
    case reading = "読んでいる"
}
