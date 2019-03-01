//
//  WatchDatabase.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 15/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

struct WatchDatabase {
    let watchDatabase = [Watch(id:0,name: "Rolex Submariner", dial: "SubDial", secHand: Hand(image: "ExSecond", scale: 0.19), minHand: Hand(image: "ExMinute", scale: 0.044), hourHand: Hand(image: "ExHour", scale: 0.06),luminescent:true, alternative: [Watch(name: "Alt1", dial: "SubDial-1",date:WatchDate(positionX: 70.0, positionY: 0.0, color: .black))]),
                         
                         Watch(id:1,name: "Rolex Milgauss", dial: "MGDial", secHand: Hand(image: "MGSecond", scale: 0.163), minHand: Hand(image: "MGMinute", scale: 0.04), hourHand: Hand(image: "MGHour", scale: 0.04)),
                         
                         Watch(id:2,name: "Rolex Explorer II", dial: "ExDial", secHand: Hand(image: "ExSecond", scale: 0.19), minHand: Hand(image: "ExMinute", scale: 0.044), hourHand: Hand(image: "ExHour", scale: 0.06),date: WatchDate(positionX: 65.0, positionY: 0.2, color: .black),gmt:Gmt(gmtHand: Hand(image: "ExGmt", scale: 0.9)),luminescent:true),
                         
                         Watch(id:3,name: "Omega Seamaster", dial: "SEMDial", secHand: Hand(image: "SEMSecond", scale: 0.17), minHand: Hand(image: "SEMMinute", scale: 0.058), hourHand: Hand(image: "SEMHour", scale: 0.1)),
                         
                         Watch(id:4,name: "Omega Speedmaster Professional", dial: "SMDial", secHand: Hand(image: "SMChr", positionX: -48, scale: 0.15), minHand: Hand(image: "SMMinute", scale: 0.05), hourHand: Hand(image: "SMHour", scale: 0.05), chronograph: Chronograph(secHand: Hand(image: "SMChrSecond", scale: 0.17), minuteHand: Hand(image: "SMChr", positionX: 47.5, scale: 0.152), hourHand: Hand(image: "SMChr",positionX:0.5, positionY: -55.5, scale: 0.152)),secondOnTop:false,alternative:[
                            Watch(name: "Alt1",dial:"SMDial-1",secHand: Hand(image: "SMChr", positionX: -48, scale: 0.12),minHand:Hand(image: "SMMinute-1", scale: 0.05),hourHand:Hand(image: "SMHour-1", scale: 0.05),chronograph:Chronograph(secHand: Hand(image: "SMChrSecond-1", scale: 0.18), minuteHand: Hand(image: "SMChr-1", positionX: 47.5, scale: 0.12), hourHand: Hand(image: "SMChr-1", positionY: -55.5, scale: 0.12)))]),
                         
                         Watch(id:5,name: "Tag Heuer Monaco", dial: "MonacoDial", secHand: Hand(image: "MonacoChr", positionX: 46, scale: 0.12), minHand: Hand(image: "MonacoMinute", scale: 0.05), hourHand: Hand(image: "MonacoHour", scale: 0.05),date: WatchDate(positionX: 0, positionY: -99, color: .white), chronograph: Chronograph(secHand: Hand(image: "MonacoChrSecond", scale: 0.19), minuteHand: Hand(image: "MonacoChr", positionX: -44, scale: 0.13)),secondOnTop:false,alternative:[Watch(name: "Alt1", dial: "MonacoDial-1", secHand: Hand(image: "MonacoChr-1", positionX: 46, scale: 0.12),minHand: Hand(image: "MonacoMinute-1", scale: 0.05), hourHand: Hand(image: "MonacoHour-1", scale: 0.05),date: WatchDate(positionX: 0, positionY: -99, color: .black), chronograph:Chronograph(secHand: Hand(image: "MonacoChrSecond-1", scale: 0.19), minuteHand: Hand(image: "MonacoChr-1", positionX: -44, scale: 0.13))),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                             Watch(name: "Alt2", dial: "MonacoDial-2", secHand: Hand(image: "MonacoChr-1", positionX: 49, scale: 0.12),minHand: Hand(image: "MonacoMinute-2", scale: 0.05), hourHand: Hand(image: "MonacoHour-2", scale: 0.05),date: WatchDate(positionX: -1.5, positionY: -74, color: .black,fontSize:9), chronograph:Chronograph(secHand: Hand(image: "MonacoChrSecond-2", scale: 0.19), minuteHand: Hand(image: "MonacoChr-1", positionX: -49.5, scale: 0.13)))]),
                         
                         Watch(id:6,name: "Bell & Ross 01-94", dial: "0194Dial", secHand: Hand(image: "0194Chr", positionX: 41, scale: 0.1), minHand: Hand(image: "0194Minute", scale: 0.05), hourHand: Hand(image: "0194Hour", scale: 0.07),date:WatchDate(positionX: 49, positionY: -57.5, color: .white), chronograph: Chronograph(secHand: Hand(image: "0194Second", scale: 0.3), minuteHand: Hand(image: "0194Chr", positionX: -43.5, scale: 0.1), hourHand: Hand(image: "0194Chr", positionY: -60, scale: 0.1)),secondOnTop:false,alternative:[Watch(name: "Alt1",dial:"0194Dial-1",secHand: Hand(image: "0194Chr-1", positionX: 41, scale: 0.1), minHand: Hand(image: "0194Minute-1", scale: 0.05), hourHand: Hand(image: "0194Hour-1", scale: 0.07),date:WatchDate(positionX: 49, positionY: -57.5, color: .white), chronograph: Chronograph(secHand: Hand(image: "0194Second-1", scale: 0.3), minuteHand: Hand(image: "0194Chr-1", positionX: -43.5, scale: 0.1), hourHand: Hand(image: "0194Chr-1", positionY: -60, scale: 0.1)))]),
                         
                         Watch(id:7,name: "Breitling Avenger Blackbird", dial: "ABDial", secHand: Hand(image: "ABSecond", scale: 0.18), minHand: Hand(image: "ABMinute", scale: 0.046), hourHand: Hand(image: "ABHour", scale: 0.046),date:WatchDate(positionX: 64.0, positionY: -0.8, color: .white)),
                         
                         Watch(id:8,name: "Patek Philippe Nautilus", dial: "NauDial", secHand: Hand(image: "NauSecond", scale: 0.22), minHand: Hand(image: "NauMinute", scale: 0.053), hourHand: Hand(image: "NauHour", scale: 0.06),date:WatchDate(positionX: 75, positionY: -1, color: .black),alternative:[Watch(name: "Alt1",dial:"NauDial-1"),Watch(name: "Alt2",dial:"NauDial-2")]),
                         
                         Watch(id:9,name: "Cartier Tank", dial: "TankDial", minHand: Hand(image: "TankMinute", scale: 0.068), hourHand: Hand(image: "TankHour", scale: 0.068),alternative:[Watch(name: "Alt1",dial:"TankDial-1")]),
                         
                         Watch(id:10,name: "Apple Hermès", dial: "HermesDial", minHand: Hand(image: "HermesMinute", scale: 0.045), hourHand: Hand(image: "HermesHour", scale: 0.045),alternative:[Watch(name:"Alt1",dial:"HermesDial-1",secHand:Hand(image: "HermesSecond", scale: 0.17),date:WatchDate(positionY: -56.0, color: .white,fontSize:27)),Watch(name:"Alt2",dial:"HermesDial-2",secHand:Hand(image: "HermesSecond", scale: 0.17),date:WatchDate(positionY: -56.0, color: .white,fontSize:27)),Watch(name:"Alt3",dial:"HermesDial-3",secHand:Hand(image: "HermesSecond", scale: 0.17),date:WatchDate(positionY: -56.0, color: .white,fontSize:27)),Watch(name:"Alt4",dial:"HermesDial-4",secHand:Hand(image: "HermesSecond", scale: 0.17),minHand:Hand(image: "HermesMinute-1", scale: 0.045),hourHand:Hand(image: "HermesHour-1", scale: 0.045),date:WatchDate(positionY: -56, color: .white,fontSize:27)),Watch(name:"Alt5",dial:"HermesDial-5",secHand:Hand(image: "HermesSecond", scale: 0.17),minHand:Hand(image: "HermesMinute", scale: 0.045),hourHand:Hand(image: "HermesHour", scale: 0.045),date:WatchDate(positionY: -55, color: UIColor(red:0.65, green:0.68, blue:0.74, alpha:1.0),fontSize:20))]),
                         
                         Watch(id:11,name: "Seiko SKX007", dial: "SKXDial", secHand: Hand(image: "SKXSecond", scale: 0.28), minHand: Hand(image: "SKXMinute", scale: 0.08), hourHand: Hand(image: "SKXHour", scale: 0.08),date:WatchDate(positionX: 78, positionY: 0.2, color: .black)),
                         
                         Watch(id:12,name: "Hublot Spirit of Big Bang", dial: "BBDial", secHand: Hand(image: "BBSecond", scale: 0.35), minHand: Hand(image: "BBMinute", scale: 0.06), hourHand: Hand(image: "BBHour", scale: 0.08), date: WatchDate(positionX: 0, positionY: -99, color: .white)),
                         
                         Watch(id:13,name: "Rolex Daytona", dial: "DayDial", secHand: Hand(image: "DayChr", positionX:-38,scale: 0.25), minHand: Hand(image: "DayMinute", scale: 0.04), hourHand: Hand(image: "DayHour", scale: 0.04), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.185), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.25), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.25)),secondOnTop:false,alternative:
                            [Watch(name: "Alt1",dial:"DayDial-1",chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.185))),Watch(name: "Alt2",dial:"DayDial-2",chronograph:Chronograph(secHand: Hand(image: "DayChrSecond-1", scale: 0.185)))]),
                         
                         Watch(id:14,name: "Patek Philippe Grande Complication", dial: "GCDial", minHand: Hand(image: "GCMinute", scale: 0.046), hourHand: Hand(image: "GCHour", scale: 0.046), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.1), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.1), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.09)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4),alternative:[Watch(name: "Alt1", dial: "GCDial-1"),Watch(name: "Alt2", dial: "GCDial-2")]),
                         
                         Watch(id:15,name: "Rolex Day-Date", dial: "PreDial", secHand: Hand(image: "PreSecond", scale: 0.18), minHand: Hand(image: "PreMinute", scale: 0.045), hourHand: Hand(image: "PreHour", scale: 0.045),date: WatchDate(positionX: 71.0, positionY: 0.2, color: .black),day:Day(dayPrefix: "Pre", positionX: 0, positionY: 98, xScale: 0.571,yScale:0.14),alternative:[Watch(name: "Alt1",dial:"PreDial-1")]),
                         
                         Watch(id:16,name: "Panerai Luminor", dial: "LumDial",secHand:Hand(image: "LumSecond", positionX:-46, scale: 0.1), minHand: Hand(image: "LumMinute", scale: 0.05), hourHand: Hand(image: "LumHour", scale: 0.05),date:WatchDate(positionX: 60, positionY: 0, color: .white),battery:Battery(batteryHand: Hand(image: "LumSecond", positionX: 22, positionY: -70, scale: 0.2)),secondOnTop:false),
                         
                         Watch(id:17,name: "IWC DaVinci Tourbillon", dial: "DaVDial", minHand: Hand(image: "DaVMinute", scale: 0.065), hourHand: Hand(image: "DaVHour", scale: 0.065),chronograph:Chronograph(secHand: Hand(image: "DaVChrSecond",positionX:1, scale: 0.17), minuteHand: Hand(image: "DaVSub",positionX:0.5,positionY:56, scale: 0.24), hourHand: Hand(image: "DaVSub",positionX:0.5,positionY:56, scale: 0.17), secondOnTop: false,minuteDialNb:60),skeleton:Skeleton(balanceWheel: "DaVBalance", positionY: -78),tourbillon:Tourbillon(tourbillion: "DaVTourbillon")),
                         
                         Watch(id:18,name: "Apple Nike +", dial: "N+Dial", secHand: Hand(image: "N+Second", scale: 0.17), minHand: Hand(image: "N+Minute", scale: 0.045), hourHand: Hand(image: "N+Hour", scale: 0.045),alternative:[Watch(name: "Alt1",dial:"N+Dial-1"),Watch(name: "Alt2",dial:"N+Dial-2"),Watch(name: "Alt6",dial:"N+Dial-6",secHand:Hand(image: "N+Second", scale: 0.17)),Watch(name: "Alt3",dial:"N+Dial-3",secHand:Hand(image: "N+Second-1", scale: 0.17)),Watch(name: "Alt4",dial:"N+Dial-4",secHand:Hand(image: "N+Second", scale: 0.17)),Watch(name: "Alt5",dial:"N+Dial-5",secHand:Hand(image: "N+Second-1", scale: 0.17)),Watch(name: "Alt7",dial:("N+Dial-7"),secHand: Hand(image: "N+Second-2", scale: 0.17),minHand: Hand(image: "N+Minute-1", scale: 0.045), hourHand: Hand(image: "N+Hour-1", scale: 0.045))]),
                         
                         Watch(id:19,name: "Audemards Piguet Royal Oak", dial: "OakDial", secHand: Hand(image: "OakSecond", scale: 0.225), minHand: Hand(image: "OakMinute", scale: 0.054), hourHand: Hand(image: "OakHour", scale: 0.054),date:WatchDate(positionX: 62, positionY: -1, color: .white),alternative:[Watch(name: "Alt1",dial:"OakDial-1"),Watch(name: "Alt1",dial:"OakDial-2")]),
                           
                         Watch(id:20,name: "Mondaine", dial: "MonDial", secHand: Hand(image: "MonSecond", scale: 0.24), minHand: Hand(image: "MonMinute", scale: 0.06), hourHand: Hand(image: "MonHour", scale: 0.06),stop2Go: true,alternative:[Watch(name: "MondaineAlt", dial: "MonDial-1", secHand: Hand(image: "MonSecond", scale: 0.28), minHand: Hand(image: "MonMinute-1", scale: 0.06), hourHand: Hand(image: "MonHour-1", scale: 0.06))]),
                         
                         Watch(id:21,name: "Rolex Sea Dweller", dial: "SeaDial", secHand: Hand(image: "ExSecond", scale: 0.15), minHand: Hand(image: "ExMinute", scale: 0.04), hourHand: Hand(image: "ExHour", scale: 0.06),date:WatchDate(positionX: 63, positionY: 2, color: .black,fontSize:13),luminescent:true),
        
                         Watch(id:22,name: "Apple Hermès DuoTone", dial: "BiTDial", minHand: Hand(image: "BiTMinute", scale: 0.045), hourHand: Hand(image: "BiTHour", scale: 0.045),date:WatchDate(positionX: -1, positionY: -56, color: UIColor(red:0.98, green:0.90, blue:0.81, alpha:1.0),fontSize:20),biColour: BiColour(backgroundColor: UIColor(red:0.29, green:0.14, blue:0.18, alpha:1.0), rotationColor: UIColor(red:0.78, green:0.22, blue:0.32, alpha:1.0)),
                               alternative:[Watch(name: "Alt1",dial: "BiTDial-1",minHand: Hand(image: "BiTMinute-1", scale: 0.045), hourHand: Hand(image: "BiTHour-1", scale: 0.045),date:WatchDate(positionX: -1, positionY: -56, color: UIColor(red:0.94, green:0.49, blue:0.19, alpha:1.0),fontSize:20),biColour:BiColour(backgroundColor: UIColor(red:0.87, green:0.83, blue:0.76, alpha:1.0), rotationColor: UIColor(red:0.15, green:0.18, blue:0.24, alpha:1.0))),
                                            Watch(name: "Alt2",dial: "BiTDial-2",minHand: Hand(image: "BiTMinute-1", scale: 0.045), hourHand: Hand(image: "BiTHour-1", scale: 0.045),date:WatchDate(positionX: -1, positionY: -56, color: .white,fontSize:20),biColour:BiColour(backgroundColor: UIColor(red:0.15, green:0.16, blue:0.26, alpha:1.0), rotationColor: UIColor(red:0.96, green:0.37, blue:0.00, alpha:1.0)))]),
                         
                         Watch(id:23,name: "Audemards Piguet Royal Oak Chronograph", dial: "OakChronoDial", secHand: Hand(image: "OakChronoSub",positionY:-45, scale: 0.2), minHand: Hand(image: "OakMinute", scale: 0.054), hourHand: Hand(image: "OakHour", scale: 0.054),date:WatchDate(positionX: 47, positionY: -61, color: .white,rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "OakSecond",scale: 0.225), minuteHand: Hand(image: "OakChronoSub", positionX: 41, scale: 0.3), hourHand: Hand(image: "OakChronoSub", positionX: -40, scale: 0.3)),secondOnTop:false,alternative:[Watch(name: "Alt1",dial:"OakChronoDial-1",chronograph:Chronograph(secHand: Hand(image: "OakSecond",scale: 0.225))),Watch(name: "Alt2",dial:"OakChronoDial-2", minHand: Hand(image: "OakChronoMinute-2", scale: 0.054), hourHand: Hand(image: "OakChronoHour-2", scale: 0.054),chronograph:Chronograph(secHand: Hand(image: "OakChronoSec-2",scale: 0.225)))]),
        
                         Watch(id:24,name:"Apple Hermès Layered",dial:"HLayeredDial",minHand:Hand(image: "HLayeredMinute", scale: 0.05),hourHand:Hand(image: "HLayeredHour", scale: 0.05),date:WatchDate(positionX: 0, positionY: -43, color: UIColor(red:0.97, green:0.96, blue:0.93, alpha:1.0),fontSize:22)),
                         
                         
                         Watch(id:29,name: "Rolex GMT Master II", dial: "MIIDial",secHand: Hand(image: "ExSecond", scale: 0.19), minHand: Hand(image: "ExMinute", scale: 0.044), hourHand: Hand(image: "ExHour", scale: 0.06),date:WatchDate(positionX: 70.0, positionY: 0.0, color: .black),gmt:Gmt(gmtHand: Hand(image: "MIIGmt", scale: 0.14)),luminescent:true),
                         
                         Watch(id: 27, name: "Movado Sapphire Synergy Chrono",dial: "SSCDial", secHand:Hand(image: "SSCSub",positionX:44,positionY:-5, scale: 0.18),minHand: Hand(image: "SSCMinute", scale: 0.04), hourHand: Hand(image: "SSCHour", scale: 0.04),date:WatchDate(positionY: -65, font: "Friz Quadrata Std", color: .white),chronograph: Chronograph(secHand: Hand(image: "SSCSecond", scale: 0.16), minuteHand: Hand(image: "SSCSub", positionX:-45.5,positionY:-5,scale: 0.18), hourHand: Hand(image: "SSCSub",positionX:-0.5,positionY:-50, scale: 0.18)),secondOnTop:false),
                         
                         Watch(id: 26, name: "Movado Museum", dial: "MuseumDial", minHand: Hand(image: "MuseumMinute", scale: 0.05), hourHand: Hand(image: "MuseumHour", scale: 0.05),alternative:[Watch(name: "Alt1",dial:"MuseumDial-1",minHand: Hand(image: "MuseumMinute", scale: 0.05), hourHand: Hand(image: "MuseumHour",scale:0.05))]),
                         
                         Watch(id: 30, name: "Audemards Piguet Royal Oak Offshore", dial: "OffShoreDial", secHand:Hand(image: "OffShoreSub2",positionY:49, scale:0.14 ),minHand: Hand(image: "OffShoreMinute", scale: 0.06), hourHand: Hand(image: "OffShoreHour", scale: 0.07),date:WatchDate(positionX:72,positionY: 0, color: .white),chronograph:Chronograph(secHand: Hand(image: "OffShoreSecond", scale: 0.19), minuteHand: Hand(image: "OffShoreSub",positionX:-48, scale: 0.14), hourHand: Hand(image: "OffShoreSub",positionX:2,positionY:-57, scale: 0.14),secondOnTop:false),secondOnTop:false),
                         
                         Watch(id:31,name: "Porsche Design 911 GT2 RS Chronograph", dial: "PDDial", minHand: Hand(image: "PDMinute", scale: 0.05), hourHand: Hand(image: "PDHour", scale: 0.05),chronograph:Chronograph(secHand: Hand(image: "PDSecond", scale: 0.163), minuteHand: Hand(image: "SMChr",positionY:45, scale: 0.15), hourHand: Hand(image: "SMChr",positionY:-41, scale: 0.15))),
                         
        
        
        ].sorted(by: { $0.name < $1.name })
    
    
    
    func getWatch(index:Int) -> Watch{
        return watchDatabase[index]
    }
    
    
    
    
}
