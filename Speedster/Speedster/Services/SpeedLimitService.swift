//
//  SpeedLimitService.swift
//  Speedster
//
//  Created by Sakura Rapolu on 7/30/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct SpeedLimitService {
    static let apiKey = "AIzaSyDP_vdpdBSqJobAnUOJTz-hlYKlHKQwDYw"
    
    static func retrieveSpeedLimits(arr: [String]) -> [String: Double] {
        var dict = [String: Double]()
        let coordinates = combineCoordinates(arr: arr)
        let parameters = ["key":apiKey,"path":"\(coordinates)","units":"MPH"]
        Alamofire.request("https://roads.googleapis.com/v1/speedLimits?", parameters: parameters).responseJSON(options:.mutableContainers) {response in
            let response = try! JSON(data: response.data!)
            for speedLimit in response["speedLimits"] {
                let placeId = speedLimit["placeId"]
                let sL = Double(speedLimit["speedLimit"])
                dict.updateValue(value: sL, forKey: placeId)
            }
        }
        return dict
    }
    
    static func combineCoordinates(arr: [String]) -> String {
        let joiner = "|"
        return arr.joined(separator: joiner)
    }
}
