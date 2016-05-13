//
//  MoreView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  猜你喜欢View

import UIKit

class MoreView: UIView {

    @IBOutlet weak private var imageImageView: UIImageView!
    @IBOutlet weak private var adressLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    
    var model: GuessLikeModel? {
        didSet {
            titleLabel.text = model?.title
            adressLabel.text = model?.address
            if let imgStr = model?.imgs?.last {
                imageImageView.wxn_setImageWithURL(NSURL(string: imgStr)!, placeholderImage: UIImage(named: "quesheng")!)
            }
        }
    }
    
    class func moreViewWithGuessLikeModel(model: GuessLikeModel) -> MoreView{
        let moreView = NSBundle.mainBundle().loadNibNamed("MoreView", owner: nil, options: nil).last as! MoreView
        moreView.model = model
        return moreView
    }
}
