//
//  SettingCell.swift
//  SmallDay
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//

import UIKit

enum SettingCellType: Int {
    case GitHub = 0
    case Recommend = 1
    case About = 2
    case Blog = 3
    case Sina = 4
    case Clean = 5
}

class SettingCell: UITableViewCell {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.alpha = 0.3
        sizeLabel.hidden = true
        selectionStyle = .None
    }

    class func settingCellWithTableView(tableView: UITableView) -> SettingCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingCell") as! SettingCell
        return cell
    }

}
