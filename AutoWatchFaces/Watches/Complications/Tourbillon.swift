//
//  Tourbillon.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Tourbillon: NSObject,Codable{
    private let tourbillion : String
    
    init(tourbillion:String) {
        self.tourbillion = tourbillion
    }
    
    func getTourbillonName()->String{
        return tourbillion
    }
}
