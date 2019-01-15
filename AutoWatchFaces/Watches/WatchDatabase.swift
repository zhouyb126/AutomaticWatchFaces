//
//  WatchDatabase.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 15/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

struct WatchDatabase {
    let watchDatabase = [Watch(name: "Rolex Submariner", dial: "SubDial", secHand: Hand(image: "SubSecond", scale: 0.44), minHand: Hand(image: "SubMinute", scale: 0.09), hourHand: Hand(image: "SubHour", scale: 0.12), alternative: [Watch(name: "Alt1", dial: "SubDial-1",date:WatchDate(positionX: 70.0, positionY: 0.0, color: .black))]),
                         
                         Watch(name: "Rolex Milgauss", dial: "MGDial", secHand: Hand(image: "MGSecond", scale: 0.35), minHand: Hand(image: "MGMinute", scale: 0.08), hourHand: Hand(image: "MGHour", scale: 0.12)),
                         
                         Watch(name: "Rolex Explorer II", dial: "ExDial", secHand: Hand(image: "ExSecond", scale: 0.4), minHand: Hand(image: "ExMinute", scale: 0.09), hourHand: Hand(image: "ExHour", scale: 0.12),date: WatchDate(positionX: 65.0, positionY: 0.2, color: .black)),
                         
                         Watch(name: "Omega Seamaster", dial: "SEMDial", secHand: Hand(image: "SEMSecond", scale: 0.39), minHand: Hand(image: "SEMMinute", scale: 0.11), hourHand: Hand(image: "SEMHour", scale: 0.2)),
                         
                         Watch(name: "Omega Speedmaster Professional", dial: "SMDial", secHand: Hand(image: "SMChr", positionX: -48.5, scale: 0.3), minHand: Hand(image: "SMMinute", scale: 0.096), hourHand: Hand(image: "SMHour", scale: 0.12), chronograph: Chronograph(secHand: Hand(image: "SMChrSecond", scale: 0.35), minuteHand: Hand(image: "SMChr", positionX: 47.5, scale: 0.3), hourHand: Hand(image: "SMChr", positionY: -55.5, scale: 0.3))),
                         
                         Watch(name: "Tag Heuer Monaco", dial: "MonacoDial", secHand: Hand(image: "MonacoChr", positionX: 46, scale: 0.28), minHand: Hand(image: "MonacoMinute", scale: 0.1), hourHand: Hand(image: "MonacoHour", scale: 0.12),date: WatchDate(positionX: 0, positionY: -99, color: .white), chronograph: Chronograph(secHand: Hand(image: "MonacoChrSecond", scale: 0.39), minuteHand: Hand(image: "MonacoChr", positionX: -46, scale: 0.28))),
                         
                         Watch(name: "Bell & Ross 01-94", dial: "0194Dial", secHand: Hand(image: "0194Chr", positionX: 41, scale: 0.2), minHand: Hand(image: "0194Minute", scale: 0.1), hourHand: Hand(image: "0194Hour", scale: 0.12),date:WatchDate(positionX: 49, positionY: -57, color: .white), chronograph: Chronograph(secHand: Hand(image: "0194Second", scale: 0.6), minuteHand: Hand(image: "0194Chr", positionX: -44, scale: 0.22), hourHand: Hand(image: "0194Chr", positionY: -60, scale: 0.22))),
                         
                         Watch(name: "Breitling Avenger Blackbird", dial: "ABDial", secHand: Hand(image: "ABSecond", scale: 0.39), minHand: Hand(image: "ABMinute", scale: 0.09), hourHand: Hand(image: "ABHour", scale: 0.12),date:WatchDate(positionX: 65.0, positionY: -0.8, color: .white)),
                         
                         Watch(name: "Philippe Patek Nautilus", dial: "NauDial", secHand: Hand(image: "NauSecond", scale: 0.44), minHand: Hand(image: "NauMinute", scale: 0.15), hourHand: Hand(image: "NauHour", scale: 0.12),date:WatchDate(positionX: 75, positionY: -1, color: .black)),
                         
                         Watch(name: "Cartier Tank", dial: "TankDial", minHand: Hand(image: "TankMinute", scale: 0.08), hourHand: Hand(image: "TankHour", scale: 0.14)),
                         
                         Watch(name: "Hermes Apple Watch", dial: "HermesDial", minHand: Hand(image: "HermesMinute", scale: 0.09), hourHand: Hand(image: "HermesHour", scale: 0.09)),
                         
                         Watch(name: "Seiko SKX007", dial: "SKXDial", secHand: Hand(image: "SKXSecond", scale: 0.6), minHand: Hand(image: "SKXMinute", scale: 0.14), hourHand: Hand(image: "SKXHour", scale: 0.15),date:WatchDate(positionX: 78, positionY: 0.2, color: .black)),
                         
                         Watch(name: "Hublot Spirit of Big Bang", dial: "BBDial", secHand: Hand(image: "BBSecond", scale: 0.73), minHand: Hand(image: "BBMinute", scale: 0.11), hourHand: Hand(image: "BBHour", scale: 0.14), date: WatchDate(positionX: 0, positionY: -99, color: .white)),
                         
                         Watch(name: "Rolex Daytona", dial: "DayDial", secHand: Hand(image: "DayChr", positionX:-37,scale: 0.55), minHand: Hand(image: "DayMinute", scale: 0.09), hourHand: Hand(image: "DayHour", scale: 0.12), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.38), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.55), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.55))),
                         
                         Watch(name: "Philippe Patek Grande Complication", dial: "GCDial", minHand: Hand(image: "GCMinute", scale: 0.09), hourHand: Hand(image: "GCHour", scale: 0.1), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.2), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.2), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.2)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4),alternative:[Watch(name: "Alt1", dial: "GCDial-1"),Watch(name: "Alt2", dial: "GCDial-2")]),
                         
                         Watch(name: "Rolex Day-Date", dial: "PreDial", secHand: Hand(image: "PreSecond", scale: 0.4), minHand: Hand(image: "PreMinute", scale: 0.09), hourHand: Hand(image: "PreHour", scale: 0.12),date: WatchDate(positionX: 71.0, positionY: 0.2, color: .black),day:Day(dayPrefix: "Pre", positionX: 0, positionY: 98, xScale: 0.571,yScale:0.14))
        
        
        ].sorted(by: { $0.name < $1.name })
    
    
    
    func getWatch(index:Int) -> Watch{
        return watchDatabase[index]
    }
    
    
    
    
}
