//
//  FeedViewController.swift
//  ViewControllersAndLogs
//
//  Created by Ilya Aleshin on 21.06.2018.
//  Copyright © 2018 Bakh. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedList: UITableView!
    
    private var items: [String] = ["Разговор о beta Xcode 10", "Шарим в логах и создаем классы вьюхам!", "TabBar - это то что нужно", "Switch, If Else и Ночной режим", "Вывод и Позиционирование"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibs : Array = Bundle.main.loadNibNamed("FeedItem", owner: self, options: nil)!
        let cell:FeedItem = nibs[0] as! FeedItem
        cell.setTitle(title: items[indexPath.row])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("this view was loaded")
    }
    
}
