//
//  WatchManager.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 12/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
class WatchManager{
    static var watchList: [Watch] {return WatchDatabase.init().watchDatabase
    }
    
    
    static var actualWatchNB = 0
    static var actualWatch = Watch(name: "", dial: "")
    
    static func configureAlternativeWatch(alternativeWatchNb:Int){
        let alternativeWatch = WatchManager.watchList[WatchManager.actualWatchNB].alternative[alternativeWatchNb - 1]
        if alternativeWatch!.dial != nil{
            WatchManager.actualWatch.dial = alternativeWatch!.dial
        }
        
        if alternativeWatch!.secHand != nil{
            WatchManager.actualWatch.secHand = alternativeWatch!.secHand
        }
        else{
            WatchManager.actualWatch.secHand = WatchManager.watchList[WatchManager.actualWatchNB].secHand
        }
        if alternativeWatch!.hourHand != nil{
            WatchManager.actualWatch.hourHand = alternativeWatch!.hourHand
        }
        else{
            WatchManager.actualWatch.hourHand = WatchManager.watchList[WatchManager.actualWatchNB].hourHand
        }
        if alternativeWatch!.minHand != nil{
            WatchManager.actualWatch.minHand = alternativeWatch!.minHand
        }
        else{
            WatchManager.actualWatch.minHand = WatchManager.watchList[WatchManager.actualWatchNB].minHand
        }
        
        if alternativeWatch!.date != nil{
            WatchManager.actualWatch.date = alternativeWatch!.date
        }
        else{
            WatchManager.actualWatch.date = WatchManager.watchList[WatchManager.actualWatchNB].date
        }
    }
    
}





