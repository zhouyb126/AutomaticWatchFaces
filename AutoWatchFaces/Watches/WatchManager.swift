//
//  WatchManager.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 12/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
class WatchManager{
    static var watchList: [Watch] {return WatchDatabase.init().watchDatabase}
    
    
    static var actualWatchNB = 0
    static var actualAlternativeWatchNB = 0
    static var actualWatch = Watch(id: 0, name: "", dial: "")
    static var inSettings = false
    static var crownLocked = false
    static var timeZone = UserDefaults.standard.value(forKey: "timeZone") as? Int
    static var nightMode = false
    
    static func configureAlternativeWatch(){
        if actualAlternativeWatchNB != 0{
            let alternativeWatch = WatchManager.watchList[actualWatchNB].alternative[actualAlternativeWatchNB - 1]
        if alternativeWatch!.dial != nil{
            WatchManager.actualWatch.dial = alternativeWatch!.dial
        }
        
        if alternativeWatch!.secHand != nil{
            WatchManager.actualWatch.secHand = alternativeWatch!.secHand
        }
        else{
            WatchManager.actualWatch.secHand = WatchManager.watchList[actualWatchNB].secHand
        }
        if alternativeWatch!.hourHand != nil{
            WatchManager.actualWatch.hourHand = alternativeWatch!.hourHand
        }
        else{
            WatchManager.actualWatch.hourHand = WatchManager.watchList[actualWatchNB].hourHand
        }
        if alternativeWatch!.minHand != nil{
            WatchManager.actualWatch.minHand = alternativeWatch!.minHand
        }
        else{
            WatchManager.actualWatch.minHand = WatchManager.watchList[actualWatchNB].minHand
        }
        
        if alternativeWatch!.date != nil{
            WatchManager.actualWatch.date = alternativeWatch!.date
        }
        else{
            WatchManager.actualWatch.date = WatchManager.watchList[actualWatchNB].date
        }
        
        if alternativeWatch?.chronograph != nil{
        if alternativeWatch!.chronograph?.secHand != nil{
            WatchManager.actualWatch.chronograph?.secHand = alternativeWatch!.chronograph?.secHand
        }
        else{
            WatchManager.actualWatch.chronograph?.secHand = WatchManager.watchList[actualWatchNB].chronograph?.secHand
        }
            
            if alternativeWatch!.chronograph?.minuteHand != nil{
                WatchManager.actualWatch.chronograph?.minuteHand = alternativeWatch!.chronograph?.minuteHand
            }
            else{
                WatchManager.actualWatch.chronograph?.minuteHand = WatchManager.watchList[actualWatchNB].chronograph?.minuteHand
            }
            
            if alternativeWatch!.chronograph?.hourHand != nil{
                WatchManager.actualWatch.chronograph?.hourHand = alternativeWatch!.chronograph?.hourHand
            }
            else{
                WatchManager.actualWatch.chronograph?.hourHand = WatchManager.watchList[actualWatchNB].chronograph?.hourHand
            }
            
    }
            if alternativeWatch!.biColour != nil{
                WatchManager.actualWatch.biColour = alternativeWatch!.biColour
            }
            else{
                WatchManager.actualWatch.biColour = WatchManager.watchList[actualWatchNB].biColour
            }
        }
        
        
    
}
    
    static func nextWatchface(){
        actualWatchNB += 1
        actualAlternativeWatchNB = 0
    }
    
    static func previousWatchface(){
       actualWatchNB -= 1
       actualAlternativeWatchNB = 0
    }

    static func setFavoriteWatchFace(){
        let defaults = UserDefaults()
        defaults.set(actualAlternativeWatchNB, forKey: "favAlternateNb")
        defaults.set(actualWatchNB, forKey: "favWatchNb")
        print(actualWatchNB)
        print(actualAlternativeWatchNB)
    }
    
    static func getInitialWatchface(){
        let defaults = UserDefaults()
        if let watchNb = defaults.value(forKey: "favWatchNb"){
            actualWatchNB = watchNb as! Int
            print(actualWatchNB)
        }
        if let alternateWatchNb = defaults.value(forKey: "favAlternateNb"){
            actualAlternativeWatchNB = alternateWatchNb as! Int
            print(actualAlternativeWatchNB)
        }
    }
    
    static func getWatchface(at indice:Int) -> Watch{
        return watchList[indice]
        
    }


}
