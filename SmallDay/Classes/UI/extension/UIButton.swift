//
//  UIButton.swift
//  SmallDay
//
//  Created by MENG on 16/5/9.
//  Copyright © 2016年 维尼的小熊. All rights reserved.
//
import UIKit

extension UIButton {
    
    @objc func set(image anImage: UIImage?, title: String,
        titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
            self.imageView?.contentMode = .Center
            self.setImage(anImage, forState: state)
            
            positionLabelRespectToImage(title, position: titlePosition, spacing: additionalSpacing)
            
            self.titleLabel?.contentMode = .Center
            self.setTitle(title, forState: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
        spacing: CGFloat) {
            let imageSize = self.imageRectForContentRect(self.frame)
            let titleFont = self.titleLabel?.font!
            let titleSize = title.sizeWithAttributes([NSFontAttributeName: titleFont!])
            
            var titleInsets: UIEdgeInsets
            var imageInsets: UIEdgeInsets
            
            switch (position){
            case .Top:
                titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                    left: -(imageSize.width), bottom: 0, right: 0)
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
            case .Bottom:
                titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                    left: -(imageSize.width), bottom: 0, right: 0)
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
            case .Left:
                titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                    right: -(titleSize.width * 2 + spacing))
            case .Right:
                titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            default:
                titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            
            self.titleEdgeInsets = titleInsets
            self.imageEdgeInsets = imageInsets
    }
}