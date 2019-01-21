//
//  WatchDatabase.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 15/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

struct WatchDatabase {
    let watchDatabase = [Watch(name: "Rolex Submariner", dial: "SubDial", secHand: Hand(image: "SubSecond", scale: 0.44), minHand: Hand(image: "SubMinute", scale: 0.09), hourHand: Hand(image: "SubHour", scale: 0.09), alternative: [Watch(name: "Alt1", dial: "SubDial-1",date:WatchDate(positionX: 70.0, positionY: 0.0, color: .black))]),
                         
                         Watch(name: "Rolex Milgauss", dial: "MGDial", secHand: Hand(image: "MGSecond", scale: 0.35), minHand: Hand(image: "MGMinute", scale: 0.08), hourHand: Hand(image: "MGHour", scale: 0.08)),
                         
                         Watch(name: "Rolex Explorer II", dial: "ExDial", secHand: Hand(image: "ExSecond", scale: 0.4), minHand: Hand(image: "ExMinute", scale: 0.09), hourHand: Hand(image: "ExHour", scale: 0.09),date: WatchDate(positionX: 65.0, positionY: 0.2, color: .black)),
                         
                         Watch(name: "Omega Seamaster", dial: "SEMDial", secHand: Hand(image: "SEMSecond", scale: 0.39), minHand: Hand(image: "SEMMinute", scale: 0.11), hourHand: Hand(image: "SEMHour", scale: 0.2)),
                         
                         Watch(name: "Omega Speedmaster Professional", dial: "SMDial", secHand: Hand(image: "SMChr", positionX: -48.5, scale: 0.3), minHand: Hand(image: "SMMinute", scale: 0.096), hourHand: Hand(image: "SMHour", scale: 0.1), chronograph: Chronograph(secHand: Hand(image: "SMChrSecond", scale: 0.35), minuteHand: Hand(image: "SMChr", positionX: 47.5, scale: 0.3), hourHand: Hand(image: "SMChr", positionY: -55.5, scale: 0.3)),secondOnTop:false),
                         
                         Watch(name: "Tag Heuer Monaco", dial: "MonacoDial", secHand: Hand(image: "MonacoChr", positionX: 46, scale: 0.28), minHand: Hand(image: "MonacoMinute", scale: 0.1), hourHand: Hand(image: "MonacoHour", scale: 0.1),date: WatchDate(positionX: 0, positionY: -99, color: .white), chronograph: Chronograph(secHand: Hand(image: "MonacoChrSecond", scale: 0.41), minuteHand: Hand(image: "MonacoChr", positionX: -44, scale: 0.28)),secondOnTop:false),
                         
                         Watch(name: "Bell & Ross 01-94", dial: "0194Dial", secHand: Hand(image: "0194Chr", positionX: 41, scale: 0.2), minHand: Hand(image: "0194Minute", scale: 0.1), hourHand: Hand(image: "0194Hour", scale: 0.12),date:WatchDate(positionX: 49, positionY: -57.5, color: .white), chronograph: Chronograph(secHand: Hand(image: "0194Second", scale: 0.6), minuteHand: Hand(image: "0194Chr", positionX: -43.5, scale: 0.22), hourHand: Hand(image: "0194Chr", positionY: -60, scale: 0.22)),secondOnTop:false),
                         
                         Watch(name: "Breitling Avenger Blackbird", dial: "ABDial", secHand: Hand(image: "ABSecond", scale: 0.39), minHand: Hand(image: "ABMinute", scale: 0.09), hourHand: Hand(image: "ABHour", scale: 0.09),date:WatchDate(positionX: 64.0, positionY: -0.8, color: .white)),
                         
                         Watch(name: "Patek Philippe Nautilus", dial: "NauDial", secHand: Hand(image: "NauSecond", scale: 0.49), minHand: Hand(image: "NauMinute", scale: 0.11), hourHand: Hand(image: "NauHour", scale: 0.11),date:WatchDate(positionX: 75, positionY: -1, color: .black),alternative:[Watch(name: "Alt1",dial:"NauDial-1")]),
                         
                         Watch(name: "Cartier Tank", dial: "TankDial", minHand: Hand(image: "TankMinute", scale: 0.13), hourHand: Hand(image: "TankHour", scale: 0.13)),
                         
                         Watch(name: "Apple Hermes", dial: "HermesDial", minHand: Hand(image: "HermesMinute", scale: 0.09), hourHand: Hand(image: "HermesHour", scale: 0.09)),
                         
                         Watch(name: "Seiko SKX007", dial: "SKXDial", secHand: Hand(image: "SKXSecond", scale: 0.6), minHand: Hand(image: "SKXMinute", scale: 0.14), hourHand: Hand(image: "SKXHour", scale: 0.14),date:WatchDate(positionX: 78, positionY: 0.2, color: .black)),
                         
                         Watch(name: "Hublot Spirit of Big Bang", dial: "BBDial", secHand: Hand(image: "BBSecond", scale: 0.70), minHand: Hand(image: "BBMinute", scale: 0.11), hourHand: Hand(image: "BBHour", scale: 0.14), date: WatchDate(positionX: 0, positionY: -99, color: .white)),
                         
                         Watch(name: "Rolex Daytona", dial: "DayDial", secHand: Hand(image: "DayChr", positionX:-37,scale: 0.55), minHand: Hand(image: "DayMinute", scale: 0.09), hourHand: Hand(image: "DayHour", scale: 0.09), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.38), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.55), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.55))),
                         
                         Watch(name: "Patek Philippe Grande Complication", dial: "GCDial", minHand: Hand(image: "GCMinute", scale: 0.1), hourHand: Hand(image: "GCHour", scale: 0.1), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.2), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.2), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.2)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4),alternative:[Watch(name: "Alt1", dial: "GCDial-1"),Watch(name: "Alt2", dial: "GCDial-2")]),
                         
                         Watch(name: "Rolex Day-Date", dial: "PreDial", secHand: Hand(image: "PreSecond", scale: 0.4), minHand: Hand(image: "PreMinute", scale: 0.09), hourHand: Hand(image: "PreHour", scale: 0.09),date: WatchDate(positionX: 71.0, positionY: 0.2, color: .black),day:Day(dayPrefix: "Pre", positionX: 0, positionY: 98, xScale: 0.571,yScale:0.14)),
                         
                         Watch(name: "Panerai Luminor", dial: "LumDial",secHand:Hand(image: "LumSecond", positionX:-45, positionY: 0, scale: 0.2), minHand: Hand(image: "LumMinute", scale: 0.1), hourHand: Hand(image: "LumHour", scale: 0.1),date:WatchDate(positionX: 60, positionY: 0, color: .white),battery:Battery(batteryHand: Hand(image: "LumSecond", positionX: 22, positionY: -70, scale: 0.2)),secondOnTop:false),
                         
                         Watch(name: "IWC DaVinci Tourbillon", dial: "DaVDial", minHand: Hand(image: "DaVMinute", scale: 0.14), hourHand: Hand(image: "DaVHour", scale: 0.14),chronograph:Chronograph(secHand: Hand(image: "DaVSecond", scale: 0.38), minuteHand: Hand(image: "DaVSub",positionY:55, scale: 0.5), hourHand: Hand(image: "DaVSub",positionY:55, scale: 0.35), secondOnTop: false,minuteDialNb:60),skeleton:Skeleton(balanceWheel: "DaVBalance", positionY: -78),tourbillon:Tourbillon(tourbillion: "DaVTourbillon")),
                         
                         Watch(name: "Apple Nike +", dial: "N+Dial", secHand: Hand(image: "N+Second", scale: 0.34), minHand: Hand(image: "N+Minute", scale: 0.08), hourHand: Hand(image: "N+Hour", scale: 0.09),alternative:[Watch(name: "Alt1",dial:"N+Dial-1"),Watch(name: "Alt2",dial:"N+Dial-2"),Watch(name: "Alt3",dial:"N+Dial-3",secHand:Hand(image: "N+Second-1", scale: 0.34)),Watch(name: "Alt4",dial:"N+Dial-4",secHand:Hand(image: "N+Second", scale: 0.34))])
        
        
        ].sorted(by: { $0.name < $1.name })
    
    
    
    func getWatch(index:Int) -> Watch{
        return watchDatabase[index]
    }
    
    
    
    
}
