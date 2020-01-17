//
//  APIRequest.swift
//  wallhavenios
//
//  Created by Ilija Istuk on 16/01/2020.
//  Copyright © 2020 Kodius d.o.o. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WallhavenImage {
    var id: String
    var path: String
    var category: String
}

public func WallhavenSearchRequest() -> DataRequest {
    var images = [WallhavenImage]()
    
    return AF.request("https://wallhaven.cc/api/v1/search", encoding: JSONEncoding.default).responseJSON { response in
        if let jsonData = response.value! as? NSDictionary {
            let data = jsonData.value(forKey: "data") as! NSArray
            for image in data {
                let imageObject = image as! NSDictionary
                images.append(WallhavenImage(
                    id: imageObject.value(forKey: "id") as! String,
                    path: imageObject.value(forKey: "path") as! String,
                    category: imageObject.value(forKey: "category") as! String
                ))
            }
            print(images)
        } else {
            print("kurac")
        }
    }
    
    return images
}
