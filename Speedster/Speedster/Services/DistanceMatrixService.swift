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

struct DistanceMatrixService {
    static let apiKey = "AIzaSyDP_vdpdBSqJobAnUOJTz-hlYKlHKQwDYw"
    
//    static func getPath(originLat: Double, originLong: Double, destLat: Double, destLong: Double) -> JSON {
//        let parameters = ["key":apiKey, "units": "imperial","origins":"\(originLat),\(originLong)", "destinations":"\(destLat), \(destLong)"]
//        Alamofire.request("https://maps.googleapis.com/maps/api/distancematrix/json?", parameters: parameters).responseJSON(options:.mutableContainers) {pathData in
//            let path = try! JSON(data: pathData.data!)
//            return path
//        }
//    }
    
    static func getDuration(path: JSON) -> Double {
        return path["rows"][0]["elements"][0]["duration"]["value"].doubleValue
    }
    
    static func getDistance(path: JSON) -> Double {
        return path["rows"][0]["elements"][0]["distance"]["value"].doubleValue
    }
}
