//
//  ClassifyViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  分类

import UIKit

class ClassifyViewController: MainViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化导航条上的内容
        setNav()
    }
    
    
    private func setNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "search_1", highlImageName: "search_2", targer: self, action: "searchClick")
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func searchClick() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    
}
