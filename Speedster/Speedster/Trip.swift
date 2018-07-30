//
//  Trip.swift
//  Speedster
//
//  Created by Sakura Rapolu on 7/30/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Trip {
    
    var path = JSON()
    var estimatedDuration: Double = 0 // returned in seconds
    var actualDuration: Double? = 20
    var timeSaved: Double? = 30
    var distance: Double = 0 // returned in meters
    let apiKey = "AIzaSyDP_vdpdBSqJobAnUOJTz-hlYKlHKQwDYw"
    
    func getPath(originLat: Double, originLong: Double, destLat: Double, destLong: Double) {
        let parameters = ["key":apiKey, "units": "imperial","origins":"\(originLat),\(originLong)", "destinations":"\(destLat), \(destLong)"]
        Alamofire.request("https://maps.googleapis.com/maps/api/distancematrix/json?", parameters: parameters).responseJSON(options:.mutableContainers) {pathData in
            self.path = try! JSON(data: pathData.data!)
            self.estimatedDuration = self.path["rows"][0]["elements"][0]["duration"]["value"].doubleValue
            self.distance = self.path["rows"][0]["elements"][0]["distance"]["value"].doubleValue
        }
    }
    
    init(oLat: Double, oLong: Double, dLat: Double, dLong: Double) {
        getPath(originLat: oLat, originLong: oLong, destLat: dLat, destLong: dLong)
    }
    
    func getCurrSpeedLimit(placeID: String) -> Double {
        //needs to reference getPath output (store as a constant?)
        // or you can initilize a Trip object once you have the origin and destination and then refer to the instance variable
        
        return 1
    }
    
    func getCurrPlaceID(lat: Double, long: Double) -> String {
        return ""
    }
    
}
