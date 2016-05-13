//
//  ExperienceCell.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验TableView的Cell

import UIKit

class ExperienceCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    var eventModel: EventModel? {
        didSet {
            titleLabel.text = eventModel!.title
            
            if eventModel!.imgs?.count > 0 {
                let urlStr = eventModel!.imgs![0]
                imageImageView.wxn_setImageWithURL(NSURL(string: urlStr)!, placeholderImage: UIImage(named: "quesheng")!)
            }
        }
    }
}
