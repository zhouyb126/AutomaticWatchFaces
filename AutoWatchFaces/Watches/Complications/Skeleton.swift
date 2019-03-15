//
//  Skeleton.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Skeleton: NSObject,Codable{
    private let balanceWheel: String
    private var positionX: Double
    private var positionY: Double
    private var scale: Double
    private var movement = 0
    private var counterclockwise = false
    
    
    
    init(balanceWheel:String,positionX:Double=0,positionY:Double=0,scale:Double=1){
        self.balanceWheel = balanceWheel
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
        
    }
    
    func getBalanceWheelName() -> String{
        return balanceWheel
    }
    
    func getScale() -> Double{
        return scale
    }
    func getPosition () -> [Double]{
        return [positionX,positionY]
    }
    
    func getMovement() -> Int{
        return movement
    }
    
    func getIfCounterClockwiseRotation() -> Bool{
        return counterclockwise
    }
    
    func setCounterClockWiseRotation(value:Bool){
        counterclockwise = value
    }
    
    func setMovement(value:Int){
        movement = value
    }
    
}
