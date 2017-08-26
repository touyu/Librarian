//
//  BooksTableViewController.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/23.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit

import XLPagerTabStrip


final class BooksTableViewController: UIViewController {
    
    @IBOutlet dynamic private weak var tableView: UITableView!
    
    fileprivate var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(cellType: BookTableViewCell.self)
        
        loadData()
        tableView.reloadData()
    }
    
    private func loadData() {
        for i in 0...10 {
            let book = Book.createForTest(id: i)
            books.append(book)
        }
    }
}

extension BooksTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: BookTableViewCell.self, for: indexPath)
        cell.set(book: books[indexPath.row])
        return cell
    }
}

extension BooksTableViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: title ?? "")
    }
}

extension BooksTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailBookVC = DetailBookViewController.instantiate(withStoryboard: "Detail")
        detailBookVC.set(book: books[indexPath.row])
        show(detailBookVC, sender: self)
    }
}
