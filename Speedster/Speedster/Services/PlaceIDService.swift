//
//  PlaceIDService.swift
//  Speedster
//
//  Created by Sakura Rapolu on 7/30/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct PlaceIDService {
    static let apiKey = "AIzaSyDP_vdpdBSqJobAnUOJTz-hlYKlHKQwDYw"
    
    static func getPlaceID(lat: Double, long: Double) -> String {
        var ret: String = "" 
        let parameters = ["key":apiKey,"points":"\(lat),\(long)"]
        Alamofire.request("https://roads.googleapis.com/v1/nearestRoads?", parameters: parameters).responseJSON(options:.mutableContainers) {response in
            let response = try! JSON(data: response.data!)
            ret = response["snappedPoints"][0]["placeId"].stringValue
            print(ret)
        }
        return ret
    }
}
