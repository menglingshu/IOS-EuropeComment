//  ExperienceModel.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  体验模型

import UIKit

class ExperienceModel: NSObject, DictModelProtocol {
    var head: [ExperienceHeadModel]?
    var list: [EventModel]?
    
    static func customClassMapping() -> [String : String]? {
        return ["head" : "\(ExperienceHeadModel.self)", "list" : "\(EventModel.self)"]
    }
    
    class func loadExperienceModel(completion: (data: ExperienceModel?, error: NSError?) -> ()) {
        let path = NSBundle.mainBundle().pathForResource("Experience", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)) as! NSDictionary
            
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict, cls: ExperienceModel.self) as? ExperienceModel
            completion(data: data, error: nil)
        }
        
    }
}

class ExperienceHeadModel: NSObject {
    var feel: String?
    var shareURL: String?
    var tag: String?
    var id: Int = -1
    /// imageURL
    var adurl: String?
    var title: String?
    var mobileURL: String?
}
