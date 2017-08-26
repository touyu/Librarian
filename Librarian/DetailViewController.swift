//
//  DetailViewController.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/27.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit

class DetailBookViewController: UIViewController {
    var book: Book?
    
    @IBOutlet dynamic private weak var tableView: UITableView!
    
    fileprivate enum CellType: String {
        case title      = "タイトル"
        case author     = "著者"
        case publisher  = "出版社"
        case price      = "価格"
        case isbn       = "ISBN"
        case status     = "状態"
        case memo       = "メモ"
        
        static var list: [CellType] {
            return [.title, .author, .publisher, .price, .isbn, .status, .memo]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(cellType: TitleAndTextTableViewCell.self)
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func set(book: Book) {
        self.book = book
        title = book.title
    }
}

extension DetailBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let book = book else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(with: TitleAndTextTableViewCell.self, for: indexPath)
        let type = CellType.list[indexPath.row]
        switch type {
        case .title:
            cell.set(title: type.rawValue, detail: book.title)
        case .author:
            cell.set(title: type.rawValue, detail: book.author)
        case .publisher:
            cell.set(title: type.rawValue, detail: book.publisher)
        case .price:
            cell.set(title: type.rawValue, detail: "\(book.price)円")
        case .isbn:
            cell.set(title: type.rawValue, detail: book.isbn)
        case .status:
            cell.set(title: type.rawValue, detail: book.status.rawValue)
        case .memo:
            cell.set(title: type.rawValue, detail: book.memo)
        }
        return cell
    }
}
