//
//  swift
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
    static var alternativeWatchNb = 0
    
    static func configureAlternativeWatch(){
        let alternativeWatch = watchList[actualWatchNB].alternative[alternativeWatchNb - 1]
        if alternativeWatch!.dial != nil{
            actualWatch.dial = alternativeWatch!.dial
        }
        
        if alternativeWatch!.secHand != nil{
            actualWatch.secHand = alternativeWatch!.secHand
        }
        else{
            actualWatch.secHand = watchList[actualWatchNB].secHand
        }
        if alternativeWatch!.hourHand != nil{
            actualWatch.hourHand = alternativeWatch!.hourHand
        }
        else{
            actualWatch.hourHand = watchList[actualWatchNB].hourHand
        }
        if alternativeWatch!.minHand != nil{
            actualWatch.minHand = alternativeWatch!.minHand
        }
        else{
            actualWatch.minHand = watchList[actualWatchNB].minHand
        }
        
        if alternativeWatch!.date != nil{
            actualWatch.date = alternativeWatch!.date
        }
        else{
            actualWatch.date = watchList[actualWatchNB].date
        }
        
        if alternativeWatch?.chronograph != nil{
        if alternativeWatch!.chronograph?.secHand != nil{
            actualWatch.chronograph?.secHand = alternativeWatch!.chronograph?.secHand
        }
        else{
            actualWatch.chronograph?.secHand = watchList[actualWatchNB].chronograph?.secHand
        }
            
            if alternativeWatch!.chronograph?.minuteHand != nil{
                actualWatch.chronograph?.minuteHand = alternativeWatch!.chronograph?.minuteHand
            }
            else{
                actualWatch.chronograph?.minuteHand = watchList[actualWatchNB].chronograph?.minuteHand
            }
            
            if alternativeWatch!.chronograph?.hourHand != nil{
                actualWatch.chronograph?.hourHand = alternativeWatch!.chronograph?.hourHand
            }
            else{
                actualWatch.chronograph?.hourHand = watchList[actualWatchNB].chronograph?.hourHand
            }

    }
        
    
}





}
