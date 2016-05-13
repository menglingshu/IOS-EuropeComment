//
//  ExperHeadView.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验的顶部广告ScrollView

import UIKit

class ExperHeadView: UIView, UIScrollViewDelegate {
    
    var experModel: ExperienceModel? {
        didSet {
            // 美食
            let btn1:UIButton = UIButton(frame: CGRect(x: 30, y: -110, width: 60, height: 60))
            btn1.titleLabel?.font = UIFont(name: "Arial", size: 15)
            btn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn1.set(image: UIImage(named: "menu1"), title: "美食", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
            addSubview(btn1)
    
            //给按钮添加点击事件
            btn1.addTarget(self, action: "btn1click", forControlEvents: UIControlEvents.TouchUpInside)
            
            // 娱乐
            let btn2:UIButton = UIButton(frame: CGRect(x: 103, y: -110, width: 60, height: 60))
            btn2.titleLabel?.font = UIFont(name: "Arial", size: 15)
            btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn2.set(image: UIImage(named: "menu2"), title: "娱乐", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
            addSubview(btn2)
            btn2.addTarget(self, action: "btn2click", forControlEvents: UIControlEvents.TouchUpInside)
            
            // 华商
            let btn3:UIButton = UIButton(frame: CGRect(x: 176, y: -110, width: 60, height: 60))
            btn3.titleLabel?.font = UIFont(name: "Arial", size: 15)
            btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn3.set(image: UIImage(named: "menu3"), title: "华商", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
            addSubview(btn3)
            btn3.addTarget(self, action: "btn3click", forControlEvents: UIControlEvents.TouchUpInside)
            
            // 购物
            let btn4:UIButton = UIButton(frame: CGRect(x: 249, y: -110, width: 60, height: 60))
            btn4.titleLabel?.font = UIFont(name: "Arial", size: 15)
            btn4.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn4.set(image: UIImage(named: "menu4"), title: "购物", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
            addSubview(btn4)
            btn4.addTarget(self, action: "btn4click", forControlEvents: UIControlEvents.TouchUpInside)

            // 景点
            let btn5:UIButton = UIButton(frame: CGRect(x: 322, y: -110, width: 60, height: 60))
            btn5.titleLabel?.font = UIFont(name: "Arial", size: 15)
            btn5.set(image: UIImage(named: "menu5"), title: "景点", titlePosition: .Bottom, additionalSpacing: 10.0, state: .Normal)
            btn5.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
            btn5.setTitleColor(UIColor.blackColor(), forState: .Normal)
            addSubview(btn5)
            btn5.addTarget(self, action: "btn5click", forControlEvents: UIControlEvents.TouchUpInside)
            
            if experModel?.head?.count > 0 {
                page.numberOfPages = experModel!.head!.count
                scrollImageView.contentSize = CGSizeMake(self.width * CGFloat(experModel!.head!.count), 0)
                
                for i in 0..<experModel!.head!.count {
                    let imageV = UIImageView(frame: CGRectMake(CGFloat(i) * AppWidth, 0, AppWidth, self.height * 0.8))
                    imageV.wxn_setImageWithURL(NSURL(string: experModel!.head![i].adurl!)!, placeholderImage: UIImage(named: "quesheng")!)
                    imageV.tag = i + 1000
                    
                    let tap = UITapGestureRecognizer(target: self, action: "imageClick:")
                    imageV.userInteractionEnabled = true
                    imageV.addGestureRecognizer(tap)
                    scrollImageView.addSubview(imageV)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = theme.SDBackgroundColor

        
        addSubview(scrollImageView)
        
        addSubview(page)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollImageView.frame = CGRectMake(0, 0, self.width, self.height * 0.8)
        page.frame = CGRectMake(0, self.height * 0.8, self.width, self.height * 0.2)
    }
    
    ///MARK:- 懒加载对象
    private lazy var scrollImageView: UIScrollView = {
        
        let scrollImageView = UIScrollView()
        scrollImageView.delegate = self
        scrollImageView.showsHorizontalScrollIndicator = false
        scrollImageView.showsVerticalScrollIndicator = false
        scrollImageView.pagingEnabled = true
        return scrollImageView
        }()
    
    private var page: UIPageControl = {
        let page = UIPageControl()
        page.pageIndicatorTintColor = UIColor.grayColor()
        page.currentPageIndicatorTintColor = UIColor.blackColor()
        page.hidesForSinglePage = true
        return page
        }()
    
    weak var delegate: ExperHeadViewDelegate?
    
    func imageClick(tap: UITapGestureRecognizer) {
        delegate?.experHeadView(self, didClickImageViewAtIndex: tap.view!.tag - 1000)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

///MARK:- UIScrollViewDelegate
extension ExperHeadView {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let flag = Int(scrollView.contentOffset.x / scrollView.width)
        page.currentPage = flag
    }
}

///MARK:- 协议
protocol ExperHeadViewDelegate: NSObjectProtocol {
    
    func experHeadView(headView: ExperHeadView, didClickImageViewAtIndex index: Int)
    
}





