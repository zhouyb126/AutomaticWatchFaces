//
//  DayCycle.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class DayCycle: NSObject,Codable{
    private let dial: String
    private let positionX: Double
    private let positionY:Double
    private let scale:Double
    
    init(dial:String,positionX:Double,positionY:Double,scale:Double) {
        self.dial = dial
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
    }
    
    func getDialName() -> String{
        return dial
    }
    
    func getPosition () -> [Double]{
        return [positionX,positionY]
    }
    
    func getScale() -> Double{
        return scale
    }
}
