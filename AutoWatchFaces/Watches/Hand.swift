//
//  Hand.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Hand: NSObject,Codable{
    private let image:String
    private let positionX:Double
    private let positionY:Double
    private let scale : Double
    
    init(image:String,positionX:Double=0,positionY:Double=0,scale:Double=1) {
        self.image = image
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
    }
    
    func getImageName() -> String {
        return image
    }
    
    func getHandPosition () -> [Double]{
        return [positionX,positionY]
    }
    
    func getScale() -> Double{
        return scale
    }
    
    
    
    
}
