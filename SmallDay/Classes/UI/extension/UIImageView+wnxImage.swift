//
//  UIImageView+wnxImage.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  对UIImageView的扩展

import Foundation

extension UIImageView {
    
    func wxn_setImageWithURL(url: NSURL, placeholderImage: UIImage) {
        self.sd_setImageWithURL(url, placeholderImage: placeholderImage)
    }
    
}