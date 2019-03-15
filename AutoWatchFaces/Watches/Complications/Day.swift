//
//  Day.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation


class Day: NSObject,Codable{
    private let dayPrefix:String
    private let positionX:Double
    private let positionY:Double
    private let xScale: Double
    private let yScale :Double
    
    init(dayPrefix:String,positionX:Double,positionY:Double,xScale:Double,yScale:Double) {
        self.positionX = positionX
        self.positionY = positionY
        self.xScale = xScale
        self.yScale = yScale
        self.dayPrefix = dayPrefix
    }
    
    func getDayInString(day:Int) -> String{
        let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        
        return ("\(dayPrefix)\(days[day])")
    }
    
    func getDayPrefix()->String{
        return dayPrefix
    }
    
    func getPosition () -> [Double]{
        return [positionX,positionY]
    }
    
    func getScale() -> [Double]{
        return [xScale,yScale]
    }
}
