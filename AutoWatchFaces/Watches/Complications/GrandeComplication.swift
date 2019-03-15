//
//  GrandeComplication.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class GrandeComplication: NSObject,Codable{
    private let weekdayHand : Hand?
    private let monthHand : Hand?
    private let dateHand: Hand?
    
    init(weekdayHand:Hand?=nil,monthHand:Hand?=nil,dateHand:Hand?=nil) {
        self.weekdayHand = weekdayHand
        self.monthHand = monthHand
        self.dateHand = dateHand
    }
    
    func getWeekdayHand() -> Hand?{
        return weekdayHand
    }
    
    func getMonthHand() -> Hand?{
        return monthHand
    }
    
    func getDateHand() -> Hand?{
        return dateHand
    }
}
