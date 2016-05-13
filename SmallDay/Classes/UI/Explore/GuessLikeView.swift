
//
//  GuessLikeView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  猜你喜欢view

import UIKit

class GuessLikeView: UIView {

    class func guessLikeViewFromXib() -> GuessLikeView {
        let guessLike = NSBundle.mainBundle().loadNibNamed("GuessLikeView", owner: nil, options: nil).last as! GuessLikeView
        return guessLike
    }

}
