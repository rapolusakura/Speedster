//
//  DirectionsService.swift
//  Speedster
//
//  Created by Sakura Rapolu on 7/30/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct DirectionsService {
    static let apiKey = "AIzaSyDP_vdpdBSqJobAnUOJTz-hlYKlHKQwDYw"
    
//    static func getDirections(originLat: Double, originLong: Double, destLat: Double, destLong: Double) -> [String] {
//        let ret = [String]()
//        let parameters = ["key":apiKey, "units": "imperial","origin":"\(originLat),\(originLong)", "destination":"\(destLat), \(destLong)", "alternatives":"true"]
//        Alamofire.request("https://maps.googleapis.com/maps/api/directions/json?", parameters: parameters).responseJSON(options:.mutableContainers) {pathData in
//            let path = try! JSON(data: pathData.data!)
//            print(path)
//            for route in path["routes"] {
//                let steps = route["legs"][0]["steps"]
//                for step in steps {
//                    ret.append("\(step["start_location"]["lat"]),\(step["start_location"]["lng"])")
//                    ret.append("\(step["end_location"]["lat"]),\(step["end_location"]["lng"])")
//                }
//            }
//        }
//        return ret
//    }
    
    static func combineCoordinates(arr: [String]) -> String {
        let joiner = "|"
        return arr.joined(separator: joiner)
    }
}
