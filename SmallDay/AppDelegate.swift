//
//  AppDelegate.swift
//
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setKeyWindow()
        
        setAppAppearance()
        
        setShared()
        
        setUserMapInfo()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMianViewController", name: SD_ShowMianTabbarController_Notification, object: nil)
        
        return true
    }
    
    private func setKeyWindow() {
        window = UIWindow(frame: MainBounds)
        
        window?.rootViewController = showLeadpage()
        
        window?.makeKeyAndVisible()
    }
    
    func setUserMapInfo() {
        UserInfoManager.sharedUserInfoManager.startUserlocation()
        MAMapServices.sharedServices().apiKey = theme.GaoDeAPPKey
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - 分享设置
    func setAppAppearance() {
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Selected)
        itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.grayColor(), NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: .Normal)
        
        //设置导航栏主题
        let navAppearance = UINavigationBar.appearance()
        // 设置导航titleView字体
        navAppearance.translucent = false
        navAppearance.titleTextAttributes = [NSFontAttributeName : theme.SDNavTitleFont, NSForegroundColorAttributeName : UIColor.blackColor()]
        
        let item = UIBarButtonItem.appearance()
        item.setTitleTextAttributes([NSFontAttributeName : theme.SDNavItemFont, NSForegroundColorAttributeName : UIColor.blackColor()], forState: .Normal)
    }
    
    func setShared() {
        UMSocialData.setAppKey(theme.UMSharedAPPKey)
//        UMSocialSinaHandler.openSSOWithRedirectURL("http://www.jianshu.com/users/5fe7513c7a57/latest_articles")
        UMSocialSinaHandler.openSSOWithRedirectURL(nil)
        UMSocialWechatHandler.setWXAppId("wx485c6ee1758251bd", appSecret: "468ab73eef432f59a2aa5630e340862f", url: theme.JianShuURL)
        UMSocialConfig.hiddenNotInstallPlatforms([UMShareToWechatSession,UMShareToWechatTimeline])
    }
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return UMSocialSnsService.handleOpenURL(url)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return UMSocialSnsService.handleOpenURL(url)
    }
    
    //MARK: - 引导页设置
    private func showLeadpage() -> UIViewController {
        let versionStr = "CFBundleShortVersionString"
        let cureentVersion = NSBundle.mainBundle().infoDictionary![versionStr] as! String
        let oldVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionStr) as? String) ?? ""
        
        if cureentVersion.compare(oldVersion) == NSComparisonResult.OrderedDescending {
            NSUserDefaults.standardUserDefaults().setObject(cureentVersion, forKey: versionStr)
            NSUserDefaults.standardUserDefaults().synchronize()
            return LeadpageViewController()
        }
        
        return MainTabBarController()
    }
    
    func showMianViewController() {
        let mainTabBarVC = MainTabBarController()
        self.window!.rootViewController = mainTabBarVC
        let nav = mainTabBarVC.viewControllers![0] as? MainNavigationController
        (nav?.viewControllers[0] as! MainViewController).pushcityView()
    }
    
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        SDWebImageManager.sharedManager().imageCache.cleanDisk()
        SDWebImageManager.sharedManager().cancelAll()
    }
}

