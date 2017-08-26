//
//  HomeViewController.swift
//  Librarian
//
//  Created by Yuto Akiba on 2017/08/23.
//  Copyright © 2017年 Yuto Akiba. All rights reserved.
//

import UIKit

import XLPagerTabStrip


final class HomeViewController: ButtonBarPagerTabStripViewController {
    override func viewDidLoad() {
        // set up style before super view did load is executed
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14, weight: UIFontWeightThin)
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.selectedBarBackgroundColor = .orange
        settings.style.selectedBarHeight = 2.0
        //-
//        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(hex: 0x1E1E1E, alpha: 0.6)
            newCell?.label.textColor = .orange
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
//
        super.viewDidLoad()
//        
//        // 画面サイズによってtabのサイズが揃うようにする
//        buttonBarView.layoutIfNeeded()
        title = "登録順"
//        navigationItem.title = "登録順"
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let booksVC = BooksTableViewController.instantiate(withStoryboard: "Home")
        booksVC.title = "すべて"
        let booksVC2 = BooksTableViewController.instantiate(withStoryboard: "Home")
        booksVC2.title = BookStatus.unread.rawValue
        let booksVC3 = BooksTableViewController.instantiate(withStoryboard: "Home")
        booksVC3.title = BookStatus.read.rawValue
        let booksVC4 = BooksTableViewController.instantiate(withStoryboard: "Home")
        booksVC4.title = BookStatus.reading.rawValue
        let booksVC5 = BooksTableViewController.instantiate(withStoryboard: "Home")
        booksVC5.title = BookStatus.wannaWatch.rawValue
        return [booksVC, booksVC2, booksVC3, booksVC4, booksVC5]
    }
}
