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
    let watchDatabase = [Watch(id:0,name: "Rolex Submariner", dial: "SubDial", secHand: Hand(image: "ExSecond", scale: 0.84), minHand: Hand(image: "ExMinute", scale: 0.84), hourHand: Hand(image: "ExHour", scale: 0.44),luminescent:true,customizable:true, alternative: [
        Watch(name: "Alt1", dial: "SubDial-1",secHand: Hand(image: "ExSecond", scale: 0.84), minHand: Hand(image: "ExMinute", scale: 0.84), hourHand: Hand(image: "ExHour", scale: 0.44),date:WatchDate(positionX: 70.0, positionY: 0.0, color: [0.0,0.0,0.0]),luminescent:true,customizable:true),
        Watch(name: "Alt2", dial: "SubDial-2",secHand: Hand(image: "ExSecond", scale: 0.84), minHand: Hand(image: "ExMinute", scale: 0.84), hourHand: Hand(image: "ExHour", scale: 0.44),date:WatchDate(positionX: 70.0, positionY: 0.0, color: [0.0,0.0,0.0]),luminescent:true,customizable:true)]),
                         
                         Watch(id:1,name: "Rolex Milgauss", dial: "MGDial", secHand: Hand(image: "MGSecond", scale: 0.84), minHand: Hand(image: "MGMinute", scale: 0.84), hourHand: Hand(image: "MGHour", scale: 0.7)),
                         
                         Watch(id:2,name: "Rolex Explorer II", dial: "ExDial", secHand: Hand(image: "ExSecond", scale: 0.84), minHand: Hand(image: "ExMinute", scale: 0.84), hourHand: Hand(image: "ExHour", scale: 0.44),date: WatchDate(positionX: 65.0, positionY: 0.2, color: [0.0,0.0,0.0]),gmt:Gmt(gmtHand: Hand(image: "ExGmt", scale: 0.9)),luminescent:true),
                         
                         Watch(id:3,name: "Omega Seamaster", dial: "SEMDial", secHand: Hand(image: "SEMSecond", scale: 0.84), minHand: Hand(image: "SEMMinute", scale: 0.8), hourHand: Hand(image: "SEMHour", scale: 0.44)),
                         
                         Watch(id:4,name: "Omega Speedmaster Professional", dial: "SMDial", secHand: Hand(image: "SMChr", positionX: -48, scale: 0.4), minHand: Hand(image: "SMMinute", scale: 0.8), hourHand: Hand(image: "SMHour", scale: 0.48), chronograph: Chronograph(secHand: Hand(image: "SMChrSecond", scale: 0.8), minuteHand: Hand(image: "SMChr", positionX: 47.5, scale: 0.4), hourHand: Hand(image: "SMChr",positionX:0.5, positionY: -55.5, scale: 0.4)),secondOnTop:false,alternative:[
                            Watch(name: "Alt1",dial:"SMDial-1",secHand: Hand(image: "SMChr", positionX: -48, scale: 0.34),minHand:Hand(image: "SMMinute-1", scale: 0.8),hourHand:Hand(image: "SMHour-1", scale: 0.45),chronograph:Chronograph(secHand: Hand(image: "SMChrSecond-1", scale: 0.8), minuteHand: Hand(image: "SMChr-1", positionX: 47.5, scale: 0.34), hourHand: Hand(image: "SMChr-1", positionY: -55.5, scale: 0.34)),secondOnTop:false)]),
                         //
        Watch(id:5,name: "Tag Heuer Monaco", dial: "MonacoDial", secHand: Hand(image: "MonacoChr", positionX: 46, scale: 0.45), minHand: Hand(image: "MonacoMinute", scale: 0.96), hourHand: Hand(image: "MonacoHour", scale: 0.96),date: WatchDate(positionX: 0, positionY: -99, color: [1.0,1.0,1.0]), chronograph: Chronograph(secHand: Hand(image: "MonacoChrSecond", scale: 1), minuteHand: Hand(image: "MonacoChr", positionX: -44, scale: 0.45)),secondOnTop:false,
              alternative:[Watch(name: "Alt1", dial: "MonacoDial-1", secHand: Hand(image: "MonacoChr-1", positionX: 46, scale: 0.45),minHand: Hand(image: "MonacoMinute-1", scale: 0.96), hourHand: Hand(image: "MonacoHour-1", scale: 0.96),date: WatchDate(positionX: 0, positionY: -99, color: [0.0,0.0,0.0]), chronograph:Chronograph(secHand: Hand(image: "MonacoChrSecond-1", scale: 1), minuteHand: Hand(image: "MonacoChr-1", positionX: -44, scale: 0.45))),
                           Watch(name: "Alt2", dial: "MonacoDial-2", secHand: Hand(image: "MonacoChr-1", positionX: 49, scale: 0.45),minHand: Hand(image: "MonacoMinute-2", scale: 0.96), hourHand: Hand(image: "MonacoHour-2", scale: 0.96),date: WatchDate(positionX: -1.5, positionY: -74, color: [0.0,0.0,0.0],fontSize:9), chronograph:Chronograph(secHand: Hand(image: "MonacoChrSecond-2", scale: 1), minuteHand: Hand(image: "MonacoChr-1", positionX: -49.5, scale: 0.45)))]),
        
        Watch(id:6,name: "Bell & Ross 01-94", dial: "0194Dial", secHand: Hand(image: "0194Chr", positionX: 41, scale: 0.35), minHand: Hand(image: "0194Minute", scale: 0.8), hourHand: Hand(image: "0194Hour", scale: 0.45),date:WatchDate(positionX: 49, positionY: -57.5, color: [1.0,1.0,1.0]), chronograph: Chronograph(secHand: Hand(image: "0194Second", scale: 0.95), minuteHand: Hand(image: "0194Chr", positionX: -43.5, scale: 0.35), hourHand: Hand(image: "0194Chr", positionY: -60, scale: 0.35)),secondOnTop:false,
              alternative:[Watch(name: "Alt1",dial:"0194Dial-1",secHand: Hand(image: "0194Chr-1", positionX: 41, scale: 0.35), minHand: Hand(image: "0194Minute-1", scale: 0.8), hourHand: Hand(image: "0194Hour-1", scale: 0.45),date:WatchDate(positionX: 49, positionY: -57.5, color: [1.0,1.0,1.0]), chronograph: Chronograph(secHand: Hand(image: "0194Second-1", scale: 0.95), minuteHand: Hand(image: "0194Chr-1", positionX: -43.5, scale: 0.35), hourHand: Hand(image: "0194Chr-1", positionY: -60, scale: 0.35)))]),
        
        Watch(id:7,name: "Breitling Avenger Blackbird", dial: "ABDial", secHand: Hand(image: "ABSecond", scale: 0.85), minHand: Hand(image: "ABMinute", scale: 0.8), hourHand: Hand(image: "ABHour", scale: 0.46),date:WatchDate(positionX: 64.0, positionY: -0.8, color: [1.0,1.0,1.0])),
        
        Watch(id:8,name: "Patek Philippe Nautilus", dial: "NauDial", secHand: Hand(image: "NauSecond", scale: 0.86), minHand: Hand(image: "NauMinute", scale: 0.8), hourHand: Hand(image: "NauHour", scale: 0.5),date:WatchDate(positionX: 75, positionY: -1, color: [0.0,0.0,0.0]),alternative:[Watch(name: "Alt1",dial:"NauDial-1",secHand: Hand(image: "NauSecond", scale: 0.86), minHand: Hand(image: "NauMinute", scale: 0.8), hourHand: Hand(image: "NauHour", scale: 0.5),date:WatchDate(positionX: 75, positionY: -1, color: [0.0,0.0,0.0])),Watch(name: "Alt2",dial:"NauDial-2",secHand: Hand(image: "NauSecond", scale: 0.86), minHand: Hand(image: "NauMinute", scale: 0.8), hourHand: Hand(image: "NauHour", scale: 0.5),date:WatchDate(positionX: 75, positionY: -1, color: [0.0,0.0,0.0]))]),
        
        Watch(id:9,name: "Cartier Tank", dial: "TankDial", minHand: Hand(image: "TankMinute", scale: 0.8), hourHand: Hand(image: "TankHour", scale: 0.5),alternative:[Watch(name: "Alt1",dial:"TankDial-1",minHand: Hand(image: "TankMinute", scale: 0.8), hourHand: Hand(image: "TankHour", scale: 0.5))]),
        
        Watch(id:10,name: "Apple Hermès", dial: "HermesDial", minHand: Hand(image: "HermesMinute", scale: 0.7), hourHand: Hand(image: "HermesHour", scale: 0.4),customizable:true,alternative:[
            Watch(name:"Alt1",dial:"HermesDial-1",secHand:Hand(image: "HermesSecond", scale: 0.7),minHand: Hand(image: "HermesMinute", scale: 0.7), hourHand: Hand(image: "HermesHour", scale: 0.4),date:WatchDate(positionY: -56.0, color: [1.0,1.0,1.0]),customizable:true),
            Watch(name:"Alt2",dial:"HermesDial-2",secHand:Hand(image: "HermesSecond", scale: 0.7),minHand: Hand(image: "HermesMinute", scale: 0.7), hourHand: Hand(image: "HermesHour", scale: 0.4),date:WatchDate(positionY: -56.0, color: [1.0,1.0,1.0]),customizable:true),
            Watch(name:"Alt3",dial:"HermesDial-3",secHand:Hand(image: "HermesSecond", scale: 0.7),minHand: Hand(image: "HermesMinute", scale: 0.7), hourHand: Hand(image: "HermesHour", scale: 0.4),date:WatchDate(positionY: -56.0, color: [1.0,1.0,1.0]),customizable:true),
            Watch(name:"Alt4",dial:"HermesDial-4",secHand:Hand(image: "HermesSecond", scale: 0.7),minHand:Hand(image: "HermesMinute-1", scale: 0.7),hourHand:Hand(image: "HermesHour-1", scale: 0.4),date:WatchDate(positionY: -56, color: [1.0,1.0,1.0]),customizable:true),
            
            Watch(name:"Alt1",dial:"HermesDial-5",minHand:Hand(image: "HermesMinute-2", scale: 0.8),hourHand:Hand(image: "HermesHour-2", scale: 0.5),date:WatchDate(positionY: -56, color: [1.0,1.0,1.0]),customizable:true)]),
        
        //                         Watch(id:11,name: "Seiko SKX007", dial: "SKXDial", secHand: Hand(image: "SKXSecond", scale: 0.28), minHand: Hand(image: "SKXMinute", scale: 0.08), hourHand: Hand(image: "SKXHour", scale: 0.08),date:WatchDate(positionX: 78, positionY: 0.2, color: [0.0,0.0,0.0])),
        
        Watch(id:12,name: "Hublot Spirit of Big Bang", dial: "BBDial", secHand: Hand(image: "BBSecond", scale: 0.83), minHand: Hand(image: "BBMinute", scale: 0.8), hourHand: Hand(image: "BBHour", scale: 0.5), date: WatchDate(positionX: 0, positionY: -99, color: [1.0,1.0,1.0])),
        
        Watch(id:13,name: "Rolex Daytona", dial: "DayDial", secHand: Hand(image: "DayChr", positionX:-38,scale: 0.75), minHand: Hand(image: "DayMinute", scale: 0.85), hourHand: Hand(image: "DayHour", scale: 0.4), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.85), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.75), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.75)),secondOnTop:false,alternative:
            [Watch(name: "Alt1",dial:"DayDial-1",secHand: Hand(image: "DayChr", positionX:-38,scale: 0.75), minHand: Hand(image: "DayMinute", scale: 0.85), hourHand: Hand(image: "DayHour", scale: 0.4), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond", scale: 0.85), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.75), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.75)),secondOnTop:false),Watch(name: "Alt2",dial:"DayDial-2",secHand: Hand(image: "DayChr", positionX:-38,scale: 0.75), minHand: Hand(image: "DayMinute", scale: 0.85), hourHand: Hand(image: "DayHour", scale: 0.4), chronograph:Chronograph(secHand: Hand(image: "DayChrSecond-1", scale: 0.85), minuteHand: Hand(image: "DayChr", positionX:37, scale: 0.75), hourHand: Hand(image: "DayChr", positionY:-55.5, scale: 0.75)),secondOnTop:false)]),
        
        Watch(id:14,name: "Patek Philippe Grande Complication", dial: "GCDial", minHand: Hand(image: "GCMinute", scale: 0.8), hourHand: Hand(image: "GCHour", scale: 0.46), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.25), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.25), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.5)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4),alternative:[Watch(name: "Alt1", dial: "GCDial-1",minHand: Hand(image: "GCMinute", scale: 0.8), hourHand: Hand(image: "GCHour", scale: 0.46), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.25), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.25), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.5)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4)),Watch(name: "Alt2", dial: "GCDial-2",minHand: Hand(image: "GCMinute", scale: 0.8), hourHand: Hand(image: "GCHour", scale: 0.46), grandeComplication:GrandeComplication(weekdayHand: Hand(image: "GCSub", positionX: -34, scale: 0.25), monthHand: Hand(image: "GCSub", positionX: 35, scale: 0.25), dateHand: Hand(image: "GCDate",positionY: -49.9, scale: 0.5)),dayCycle:DayCycle(dial: "GCDayCycle", positionX: 0.2, positionY: -49.9, scale: 0.4))]),
        
        Watch(id:15,name: "Rolex Day-Date", dial: "PreDial", secHand: Hand(image: "PreSecond", scale: 0.9), minHand: Hand(image: "PreMinute", scale: 0.85), hourHand: Hand(image: "PreHour", scale: 0.45),date: WatchDate(positionX: 71.0, positionY: 0.2, color: [0.0,0.0,0.0]),day:Day(dayPrefix: "Pre", positionX: 0, positionY: 98, xScale: 0.571,yScale:0.14),alternative:[
            Watch(name: "Alt1",dial:"PreDial-1",secHand: Hand(image: "PreSecond", scale: 0.9), minHand: Hand(image: "PreMinute", scale: 0.85), hourHand: Hand(image: "PreHour", scale: 0.45),date: WatchDate(positionX: 71.0, positionY: 0.2, color: [1.0,1.0,1.0]),day:Day(dayPrefix: "Pre2", positionX: 0, positionY: 98, xScale: 0.571,yScale:0.14))]),
        
        Watch(id:16,name: "Panerai Luminor", dial: "LumDial",secHand:Hand(image: "LumSecond", positionX:-46, scale: 0.8), minHand: Hand(image: "LumMinute", scale: 1), hourHand: Hand(image: "LumHour", scale: 1),date:WatchDate(positionX: 60, positionY: 0, color: [1.0,1.0,1.0]),battery:Battery(batteryHand: Hand(image: "LumSecond", positionX: 22, positionY: -70, scale: 0.9)),secondOnTop:false),
        
        Watch(id: 17, name: "IWC DaVinci Tourbillon", dial: "DaVDial", minHand: Hand(image: "DaVMinute", scale: 0.85), hourHand: Hand(image: "DaVHour", scale: 0.65),chronograph:Chronograph(secHand: Hand(image: "DaVChrSecond",positionX:-1,positionY:-1, scale: 0.9), minuteHand: Hand(image: "DaVSub",positionX:0.5,positionY:56, scale: 0.5), hourHand: Hand(image: "DaVSub",positionX:0.5,positionY:56, scale: 0.7)),skeleton:Skeleton(balanceWheel: "DaVBalance",positionY:-58,scale: 0.2),tourbillon:Tourbillon(tourbillion: "DaVTourbillon")),
        
        Watch(id:18,name: "Apple Nike +", dial: "N+Dial", secHand: Hand(image: "N+Second", scale: 1), minHand: Hand(image: "N+Minute", scale: 1), hourHand: Hand(image: "N+Hour", scale: 1),customizable:true,alternative:[
            Watch(name: "Alt1",dial:"N+Dial-1",secHand: Hand(image: "N+Second-1", scale: 1), minHand: Hand(image: "N+Minute", scale: 1), hourHand: Hand(image: "N+Hour", scale: 1),customizable:true)
            ,Watch(name: "Alt2",dial:"N+Dial-2",secHand: Hand(image: "N+Second", scale: 1), minHand: Hand(image: "N+Minute-1", scale: 1), hourHand: Hand(image: "N+Hour-1", scale: 1),customizable:true),
             Watch(name: "Alt3",dial:"N+Dial-3",secHand:Hand(image: "N+Second-1", scale: 1),minHand: Hand(image: "N+Minute", scale: 1), hourHand: Hand(image: "N+Hour", scale: 1),customizable:true),
             Watch(name: "Alt4",dial:"N+Dial-4",secHand:Hand(image: "N+Second-1", scale: 1),minHand: Hand(image: "N+Minute", scale: 1), hourHand: Hand(image: "N+Hour", scale: 1),customizable:true),
             ]),
        
        Watch(id:19,name: "Audemards Piguet Royal Oak", dial: "OakDial", secHand: Hand(image: "OakSecond", scale: 0.8), minHand: Hand(image: "OakMinute", scale: 0.7), hourHand: Hand(image: "OakHour", scale: 0.45),date:WatchDate(positionX: 62, positionY: -1, color: [1.0,1.0,1.0]),alternative:
            [Watch(name: "Alt1",dial:"OakDial-1",secHand: Hand(image: "OakSecond", scale: 0.8), minHand: Hand(image: "OakMinute", scale: 0.7), hourHand: Hand(image: "OakHour", scale: 0.45),date:WatchDate(positionX: 62, positionY: -1, color: [1.0,1.0,1.0])),
             Watch(name: "Alt1",dial:"OakDial-2",secHand: Hand(image: "OakSecond", scale: 0.8), minHand: Hand(image: "OakMinute", scale: 0.7), hourHand: Hand(image: "OakHour", scale: 0.45),date:WatchDate(positionX: 62, positionY: -1, color: [1.0,1.0,1.0]))]),
        
        Watch(id:20,name: "Mondaine", dial: "MonDial", secHand: Hand(image: "MonSecond", scale: 0.8), minHand: Hand(image: "MonMinute", scale: 0.8), hourHand: Hand(image: "MonHour", scale: 0.5),stop2Go: true,alternative:[Watch(name: "MondaineAlt", dial: "MonDial-1", secHand: Hand(image: "MonSecond", scale: 0.8), minHand: Hand(image: "MonMinute-1", scale: 0.8), hourHand: Hand(image: "MonHour-1", scale: 0.5))
                                                                                                                                                                                                                             
                                                                                                                                                                                                                             ]),
        
        Watch(id:21,name: "Rolex Sea Dweller", dial: "SeaDial", secHand: Hand(image: "ExSecond", scale: 0.7), minHand: Hand(image: "ExMinute", scale: 0.7), hourHand: Hand(image: "ExHour", scale: 0.44),date:WatchDate(positionX: 63, positionY: 1, color: [0.0,0.0,0.0],fontSize:13),luminescent:true),
        
        
        
        Watch(id:22,name: "Apple Hermès DuoTone", dial: "DuoTDial", minHand: Hand(image: "DuoTMinute", scale: 1), hourHand: Hand(image: "DuoTHour", scale: 1),date:WatchDate(positionX:0,positionY: -56,font:"Hermes Cape Cod", color: [0.98,0.90,0.81],fontSize:20),biColour: DuoTone(backgroundColor:[0.29,0.14,0.18], rotationColor:[0.78,0.22,0.32]),
              alternative:[Watch(name: "Alt1",dial: "DuoTDial-1",minHand: Hand(image: "DuoTMinute-1", scale: 1), hourHand: Hand(image: "DuoTHour-1", scale: 1),date:WatchDate(positionX:0,positionY: -56, font:"Hermes Cape Cod",color: [0.94,0.49,0.19],fontSize:20),biColour:DuoTone(backgroundColor:[0.87,0.83,0.76], rotationColor: [0.15,0.18,0.24])),
                           Watch(name: "Alt2",dial: "DuoTDial-2",minHand: Hand(image: "DuoTMinute", scale: 1), hourHand: Hand(image: "DuoTHour", scale: 1),date:WatchDate(positionX:0,positionY: -56, font:"Hermes Cape Cod",color: [0.98,0.90,0.81],fontSize:20),biColour:DuoTone(),customizable:true),
                           Watch(name: "Alt3",dial: "DuoTDial-3",minHand: Hand(image: "DuoTMinute-1", scale: 1), hourHand: Hand(image: "DuoTHour-1", scale: 1),date:WatchDate(positionX:0,positionY: -56, font:"Hermes Cape Cod",color: [0.94,0.49,0.19],fontSize:20),biColour:DuoTone(),customizable:true),
                           
                           Watch(name: "Alt4",dial: "DuoTDial-4",minHand: Hand(image: "DuoTMinute-2", scale: 1), hourHand: Hand(image: "DuoTHour-2", scale: 1),date:WatchDate(positionX:0,positionY: -56, font:"Hermes Cape Cod",color: [1.0,1.0,1.0],fontSize:20),biColour:DuoTone(),customizable:true)
            ]),
        
        Watch(id:23,name: "Audemards Piguet Royal Oak Chronograph", dial: "OakChronoDial", secHand: Hand(image: "OakChronoSub",positionY:-45, scale: 0.3), minHand: Hand(image: "OakMinute", scale: 0.8), hourHand: Hand(image: "OakHour", scale: 0.54),date:WatchDate(positionX: 47, positionY: -61, color: [1.0,1.0,1.0],rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "OakSecond",positionY:0,scale: 0.8), minuteHand: Hand(image: "OakChronoSub", positionX: 41, scale: 0.4), hourHand: Hand(image: "OakChronoSub", positionX: -40, scale: 0.4)),secondOnTop:false,
              alternative:[Watch(name: "Alt1",dial:"OakChronoDial-1",secHand: Hand(image: "OakChronoSub",positionY:-45, scale: 0.3), minHand: Hand(image: "OakMinute", scale: 0.8), hourHand: Hand(image: "OakHour", scale: 0.54),date:WatchDate(positionX: 47, positionY: -61, color: [1.0,1.0,1.0],rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "OakSecond",positionY:0,scale: 0.8), minuteHand: Hand(image: "OakChronoSub", positionX: 41, scale: 0.4), hourHand: Hand(image: "OakChronoSub", positionX: -40, scale: 0.4)))
                ,Watch(name: "Alt2",dial:"OakChronoDial-2",secHand: Hand(image: "OakChronoSub",positionY:-45, scale: 0.3), minHand: Hand(image: "OakChronoMinute-2", scale: 0.8), hourHand: Hand(image: "OakChronoHour-2", scale: 0.54),date:WatchDate(positionX: 47, positionY: -61, color: [1.0,1.0,1.0],rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "OakChronoSec-2",scale: 0.8),minuteHand: Hand(image: "OakChronoSub", positionX: 41, scale: 0.4), hourHand: Hand(image: "OakChronoSub", positionX: -40, scale: 0.4)))]),
        
        Watch(id:24,name:"Apple Hermès Layered",dial:"HLayeredDial",minHand:Hand(image: "HLayeredMinute", scale: 0.75),hourHand:Hand(image: "HLayeredHour", scale: 0.45),date:WatchDate(positionX: 0, positionY: -43,font:"Hermes Cape Cod",color:[0.97,0.96,0.93],fontSize:25)),
        
        Watch(id:25,name: "Breitling Chronoliner B04", dial: "B04Dial", secHand: Hand(image: "B04Sub", positionX:-39,positionY:3, scale: 0.37), minHand: Hand(image: "B04Minute", scale: 0.7), hourHand: Hand(image: "B04Hour", scale: 0.5),date:WatchDate(positionX: 38, positionY: -37.2, color: [1.0,1.0,1.0],fontSize:9,rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "B04Second",scale: 0.8), minuteHand:  Hand(image: "B04Sub2", positionX: 41,positionY:3, scale: 0.33), hourHand: Hand(image: "B04Sub",positionX:1, positionY: -36, scale: 0.37)), secondOnTop: false,gmt:Gmt(gmtHand: Hand(image: "B04Gmt", scale: 0.8)),
              alternative:[
                Watch(name:"Alt1",dial:"B04Dial-1",secHand: Hand(image: "B04Sub", positionX:-39,positionY:3, scale: 0.37), minHand: Hand(image: "B04Minute", scale: 0.7), hourHand: Hand(image: "B04Hour", scale: 0.5),date:WatchDate(positionX: 38, positionY: -37.2, color: [1.0,1.0,1.0],fontSize:9,rotation:-0.855),chronograph:Chronograph(secHand: Hand(image: "B04Second",scale: 0.8), minuteHand:  Hand(image: "B04Sub2", positionX: 41,positionY:3, scale: 0.33), hourHand: Hand(image: "B04Sub",positionX:1, positionY: -36, scale: 0.37)), secondOnTop: false,gmt:Gmt(gmtHand: Hand(image: "B04Gmt", scale: 0.8)))]),
        //                                ,Watch(name:"Alt2",dial:"B04Dial-2")])
        
        Watch(id: 26, name: "Movado Museum", dial: "MuseumDial", minHand: Hand(image: "MuseumMinute", scale: 0.7), hourHand: Hand(image: "MuseumHour", scale: 0.5),alternative:[Watch(name: "Alt1",dial:"MuseumDial-1",minHand: Hand(image: "MuseumMinute", scale: 0.7), hourHand: Hand(image: "MuseumHour",scale: 0.7))]),
        
        Watch(id: 27, name: "Movado Sapphire Synergy Chrono",dial: "SSCDial", secHand:Hand(image: "SSCSub",positionX:44,positionY:-5, scale: 0.42),minHand: Hand(image: "SSCMinute", scale: 0.7), hourHand: Hand(image: "SSCHour", scale: 0.5),date:WatchDate(positionY: -65, font: "Friz Quadrata Std", color: [1.0,1.0,1.0]),chronograph: Chronograph(secHand: Hand(image: "SSCSecond", scale: 0.75), minuteHand: Hand(image: "SSCSub", positionX:-45.5,positionY:-5,scale: 0.42), hourHand: Hand(image: "SSCSub",positionX:-0.5,positionY:-50, scale: 0.42)),secondOnTop:false),
        
        
        Watch(id: 28, name: "Hublot Sang Bleu", dial: "SBDial",topLayer:TopLayer(imageName: "SBTopLayer", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec"),minHand:Hand(image: "SBMinute"),hourHand:Hand(image: "SBHour"),alternative:[
            Watch(name: "Alt1",dial:"SBDial-1",topLayer:TopLayer(imageName: "SBTopLayer", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec"),minHand:Hand(image: "SBMinute"),hourHand:Hand(image: "SBHour"))
            ,Watch(name: "Alt2",dial:"SBDial-2",topLayer:TopLayer(imageName: "SBTopLayer", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec"),minHand:Hand(image: "SBMinute"),hourHand:Hand(image: "SBHour"))
            ,Watch(name:"Alt3",dial: "SBDial-3",topLayer:TopLayer(imageName: "SBTopLayer", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec"),minHand:Hand(image: "SBMinute"),hourHand:Hand(image: "SBHour")),
             Watch(name:"Alt4",dial: "SBDial-4",topLayer:TopLayer(imageName: "SBTopLayer-1", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec-1"),minHand:Hand(image: "SBMinute-1"),hourHand:Hand(image: "SBHour-1")),
             Watch(name:"Alt5",dial: "SBDial-5",topLayer:TopLayer(imageName: "SBTopLayer-1", positionY: 43, scale: 0.2),secHand:Hand(image: "SBSec-1"),minHand:Hand(image: "SBMinute-1"),hourHand:Hand(image: "SBHour-1"))]),
        
        Watch(id:31,name: "Porsche Design 911 GT2 RS Chronograph", dial: "PDDial", minHand: Hand(image: "PDMinute", scale: 1), hourHand: Hand(image: "PDHour", scale: 1),chronograph:Chronograph(secHand: Hand(image: "PDSecond", scale: 1), minuteHand: Hand(image: "SMChr",positionY:45, scale: 0.4), hourHand: Hand(image: "SMChr",positionY:-41, scale: 0.4))),
        
        Watch(id:29,name: "Rolex GMT Master II",dial: "MIIDial", secHand: Hand(image: "ExSecond", scale: 0.84), minHand: Hand(image: "ExMinute", scale: 0.84), hourHand: Hand(image: "ExHour", scale: 0.44), date: WatchDate(positionX: 70.0, positionY: 0.0, color: [0.0,0.0,0.0]),gmt:Gmt(gmtHand: Hand(image: "MIIGmt", scale: 1)),luminescent:true),
        
        Watch(id: 30, name: "Audemards Piguet Royal Oak Offshore", dial: "OffShoreDial", secHand:Hand(image: "OffShoreSub2",positionY:49, scale:1 ),minHand: Hand(image: "OffShoreMinute", scale: 1), hourHand: Hand(image: "OffShoreHour", scale: 1),date:WatchDate(positionX:72,positionY: 0, color: [1.0,1.0,1.0]),chronograph:Chronograph(secHand: Hand(image: "OffShoreSecond", scale: 1), minuteHand: Hand(image: "OffShoreSub",positionX:-48, scale: 1), hourHand: Hand(image: "OffShoreSub",positionX:2,positionY:-57, scale: 1),secondOnTop:false),secondOnTop:false),
        
        Watch(id: 32, name: "IWC Portuguese", dial: "PorDial",secHand:Hand(image: "PorSec",positionY:-63), minHand: Hand(image: "PorMin", scale: 1.0), hourHand: Hand(image: "PorHour", scale: 1.0),skeleton: Skeleton(balanceWheel: "PorBalance", positionX: -53.0, positionY: 00.0,scale:0.25),secondOnTop:false),
        
        Watch(id: 33, name: "Apple Color",secHand: Hand(image: "N+Second-1", scale: 1), minHand: Hand(image: "N+Minute", scale: 1), hourHand: Hand(image: "N+Hour", scale: 1),customizable:true),
        
        Watch(id: 34, name: "Jaeger Lecoultre Reverso",dial:"RevDial",secHand: Hand(image: "RevSecond", positionY:-63,scale: 1), minHand: Hand(image: "RevMinute", scale: 1), hourHand: Hand(image: "RevHour", scale: 1)),
        
        Watch(id: 35, name: "UBoat 1001",dial:"1001Dial",secHand: Hand(image: "1001Sec",scale: 1), minHand: Hand(image: "1001Min", scale: 1), hourHand: Hand(image: "1001Hour", scale: 1))
        
        
        
        ].sorted(by: { $0.name < $1.name })
    
    func sortedWatchListByName() {
    }
    
    func getWatch(index:Int) -> Watch{
        return watchDatabase[index]
    }
    
    func getWatchDatabase()->[Watch]{
        return watchDatabase
    }
    
    
    
}
