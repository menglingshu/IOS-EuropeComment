//
//  AboutWeViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  关于我们

import UIKit

class AboutWeViewController: UIViewController {

    init() {
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "关于我们"
    }
}
