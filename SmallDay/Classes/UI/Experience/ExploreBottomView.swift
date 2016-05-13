//
//  ExploreBottomView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验详情ViewController动态加载的地步提醒View

import UIKit

class ExploreBottomView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var remindBtn: UIButton!
    @IBOutlet weak var bottomLineView: UIView!
    
    class func exploreBottomViewFromXib(title: String, subTitle: String, target: AnyObject, action: Selector, showBtn: Bool, showArrow: Bool) -> ExploreBottomView {
        
        let expView = NSBundle.mainBundle().loadNibNamed("ExploreBottomView", owner: nil, options: nil).last as! ExploreBottomView
        expView.titleLabel.text = title
        expView.subTitleLabel.text = subTitle
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        expView.addGestureRecognizer(tap)
        expView.remindBtn.hidden = !showBtn
        expView.arrowImageView.hidden = !showArrow
        expView.backgroundColor = UIColor.clearColor()
        expView.remindBtn.enabled = false
        expView.userInteractionEnabled = true
        return expView
    }
}

