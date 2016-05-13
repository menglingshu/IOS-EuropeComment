//
//  nearCell.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  附近地图展示的cell

import UIKit

class nearCell: UICollectionViewCell {
    
    var nearModel: EventModel? {
        didSet {
            let urlStr = nearModel!.imgs![0]
            imageImageView.wxn_setImageWithURL(NSURL(string: urlStr)!, placeholderImage: UIImage(named: "quesheng")!)
            adressLabel.text = nearModel?.address
            titleLabel.text = nearModel?.title
            disLabel.text = nearModel!.distanceForUser
        }
    }
    
    @IBOutlet private weak var disLabel: UILabel!
    @IBOutlet private weak var adressLabel: UILabel!
    @IBOutlet private weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.whiteColor()
    }
    
}
