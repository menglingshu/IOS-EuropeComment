//
//  UserInfoManager.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  用户位置信息管理

import UIKit

class UserInfoManager: NSObject {
    
    private static let sharedInstance = UserInfoManager()
    var userPosition: CLLocationCoordinate2D?
    private lazy var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        return locationManager
        }()
    
    
    class var sharedUserInfoManager: UserInfoManager {
        return sharedInstance
    }
    
    /// 获取用户位置授权,定位用户当前坐标
    func startUserlocation() {
        locationManager.autoContentAccessingProxy
        locationManager.startUpdatingLocation()
    }
    
}

extension UserInfoManager: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userPos = locations[0] as CLLocation
        userPosition = userPos.coordinate
        //            print("定位定位")
        locationManager.stopUpdatingLocation()
        
    }
    
}