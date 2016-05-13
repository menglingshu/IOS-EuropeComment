//
//  OrderViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  我的订单

import UIKit

class OrderViewController: UIViewController {
    
    init() {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的订单"
        view.backgroundColor = theme.SDBackgroundColor
        
    }
    
}
