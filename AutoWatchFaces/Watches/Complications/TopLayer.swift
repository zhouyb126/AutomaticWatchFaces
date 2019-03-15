//
//  TopLayer.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
class TopLayer: NSObject,Codable{
    private let imageName:String
    private let positionX:Double
    private let positionY: Double
    private let scale : Double
    
    init(imageName:String,positionX:Double=0,positionY:Double=0,scale:Double) {
        self.imageName = imageName
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
    }
    
    func getImageName() -> String{
        return imageName
    }
    
    func getPosition () -> [Double]{
        return [positionX,positionY]
    }
    
    func getScale() -> Double{
        return scale
    }
}
