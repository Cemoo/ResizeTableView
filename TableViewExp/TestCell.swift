//
//  TestCell.swift
//  TableViewExp
//
//  Created by Erencan Evren on 7.09.2018.
//  Copyright © 2018 Cemal BAYRI. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {
    
    @IBOutlet weak var lblTest: UILabel!
    @IBOutlet weak var tbCell: UITableView!
    
    var delegate: ResizeProtocol!
    
    var tempHeight: CGFloat = 0
    @IBOutlet weak var tbHeightConst: NSLayoutConstraint!
    
    var colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.orange] {
        didSet {
            updateTbHeight()
            tbCell.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tbCell.delegate = self
        tbCell.dataSource = self
    }
    
    func updateTbHeight() {
        UIView.animate(withDuration: 0.1) {
            self.tbHeightConst.constant += 80
            self.delegate.resize(self.tempHeight)
            self.layoutIfNeeded()
        }
    }

}

extension TestCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbCell.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tempHeight = self.tbCell.frame.height / CGFloat(self.colors.count)
        return tempHeight
    }
}

protocol ResizeProtocol {
    func resize(_ more: CGFloat)
}
