//
//  Battery.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Battery: NSObject,Codable{
    private let batteryHand : Hand?
    
    init(batteryHand:Hand?=nil) {
        self.batteryHand = batteryHand
    }
    
    func getBatteryHand() -> Hand?{
        return batteryHand
    }
}
