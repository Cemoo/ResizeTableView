//
//  ViewController.swift
//  TableViewExp
//
//  Created by Erencan Evren on 7.09.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightConst: NSLayoutConstraint!
    @IBOutlet weak var tbTest: UITableView!
    var colors: [UIColor] = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.orange]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbTest.delegate = self
        tbTest.dataSource = self
    }
    
    @IBAction func btnTap(_ sender: Any) {
        let indexPath = IndexPath(row: colors.count, section: 0)
        colors.append(UIColor.gray)
        tbTest.insertRows(at: [indexPath], with: .automatic)
        tbTest.reloadData()
        resizeTableViewHeight()
    }
    
    func resizeTableViewHeight() {
        UIView.animate(withDuration: 0.1) {
            self.heightConst.constant = CGFloat(82 * self.colors.count)
            self.view.layoutIfNeeded()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbTest.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}

