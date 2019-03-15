//
//  BiColour.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

class DuoTone: NSObject,Codable{
    private var backgroundColor : [Float]?
    private var rotationColor : [Float]?
    
    init(backgroundColor: [Float]=[0.0,0.0,0.0], rotationColor:[Float]=[1.0,1.0,1.0] ){
        self.backgroundColor = backgroundColor
        self.rotationColor = rotationColor
    }
    
    func getBackgroundColor () -> [Float]{
        return backgroundColor!
    }
    
    func getForegroundColor() -> [Float]{
        return rotationColor!
    }
}
