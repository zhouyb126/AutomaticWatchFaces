//
//  WatchDate.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation


class WatchDate: NSObject,Codable{
    private let positionX:Double?
    private let positionY: Double
    private  let font : String?
    private  let color: [Double]
    private let fontSize : Int?
    private let rotation : Double?
    
    init(positionX:Double?=0.0,positionY:Double,font:String?=nil,color:[Double],fontSize:Int?=12,rotation:Double?=0) {
        self.positionX = positionX
        self.positionY = positionY
        self.color = color
        self.fontSize = fontSize
        self.rotation = rotation
        self.font = font
    }
    
    func getPosition () -> [Double?]{
        return [positionX,positionY]
    }
    
    func getFontName() -> String?{
        return font
    }
    
    func getColor() -> [Double]{
        return color
    }
    
    func getFontSize() -> Int?{
        return fontSize
    }
    
    func getFontRotation() -> Double?{
        return rotation
    }
    
}
