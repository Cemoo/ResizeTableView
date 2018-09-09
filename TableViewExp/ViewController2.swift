//
//  ViewController2.swift
//  TableViewExp
//
//  Created by Erencan Evren on 7.09.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var tbTest: UITableView!
    
    var cellHeight: CGFloat = 360 {
        didSet {
            self.tbTest.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbTest.delegate = self
        tbTest.dataSource = self
    }

    @IBAction func btnAdd(_ sender: Any) {
        let index = IndexPath(row: 0, section: 0)
        let cell = tbTest.cellForRow(at: index) as! TestCell
        cell.colors.append(UIColor.cyan)
    }
    
}

extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbTest.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! TestCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
}

extension ViewController2: ResizeProtocol {
    func resize(_ more: CGFloat) {
        cellHeight += more
    }
}
