//
//  Gmt.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Gmt: NSObject,Codable{
    private let gmtHand : Hand
    
    
    init(gmtHand : Hand) {
        self.gmtHand = gmtHand
    }
    
    func getGmtHand() -> Hand{
        return gmtHand
    }
}
