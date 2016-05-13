//
//  ClassDetailViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  详情控制器

import UIKit

public let DetailCellHeight: CGFloat = 220

class ClassDetailViewController: UIViewController {
    
    private lazy var detailTableView: MainTableView = {
        let tableView = MainTableView(frame: MainBounds, style: .Plain, dataSource: self, delegate: self)
        tableView.rowHeight = DetailCellHeight
        tableView.contentInset = UIEdgeInsetsMake(0, 0, NavigationH, 0)
        tableView.registerNib(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: SD_DetailCell_Identifier)
        return tableView
    }()
    
    var details: DetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = theme.SDBackgroundColor
        view.addSubview(detailTableView)
        
        loadDatas()
    }
    
    private func loadDatas() {
        weak var tmpSelf = self
        DetailModel.loadDetails { (data, error) -> () in
            if error != nil {
                return
            }
            tmpSelf!.details = data
            tmpSelf!.detailTableView.reloadData()
        }
    }
}


extension ClassDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details?.list?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let event = details!.list![indexPath.row] as EventModel
        let cell = tableView.dequeueReusableCellWithIdentifier(SD_DetailCell_Identifier) as? DetailCell
        cell?.model = event
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let eventModel = details!.list![indexPath.row]
        let vc = EventViewController()
        vc.model = eventModel
        navigationController!.pushViewController(vc, animated: true)
    }
}