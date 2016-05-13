//
//  EventCellTableViewCell.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  探店每天的自定义cell

import UIKit

class EventCellTableViewCell: UITableViewCell {

    var eventModel: EveryDay? {
        didSet {
            cellTileLabel.text = eventModel!.events?.last?.feeltitle
            titleLabel.text = eventModel!.events?.last?.title
            subTltleLabel.text = eventModel!.events?.last?.address
            dayLabel.text = eventModel?.day
            monthLabel.text = eventModel?.month
            if let imageURL = NSURL(string: eventModel!.events!.last!.imgs!.last!) {
                imageImageView.wxn_setImageWithURL(imageURL, placeholderImage: UIImage(named: "quesheng")!)
            }
        }
    }
    
    @IBOutlet weak var cellTileLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTltleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
        
    }
    
    class func eventCell(tableView: UITableView) -> EventCellTableViewCell {
        let identifier = "eventCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? EventCellTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("EventCellTableViewCell", owner: nil, options: nil).last as? EventCellTableViewCell
        }
        
        return cell!
    }
    
}
