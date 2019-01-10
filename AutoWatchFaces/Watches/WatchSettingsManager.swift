//
//  WatchSettingsManager.swift
//  WatchFace Extension
//
//  Created by Sylvain Guillier on 01/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
class WatchSettingsManager {
    private static let watchDataBase = [
        WatchSettings(name: "Rolex Submariner", dial: "SubDial", secondHand: "SubSecond", minuteHand: "SubMinute", hourHand: "SubHour",secondHandScale:0.44,minuteHandScale:0.09,hourHandScale:0.12),
        
        WatchSettings(name: "Rolex Milgauss", dial: "MGDial", secondHand: "MGSecond", minuteHand: "MGMinute", hourHand: "MGHour",secondHandScale:0.35,minuteHandScale: 0.08,hourHandScale:0.12),
        
        WatchSettings(name: "Rolex Explorer II", dial: "ExDial", secondHand: "ExSecond", minuteHand: "ExMinute", hourHand: "ExHour",secondHandScale:0.4,minuteHandScale:0.09,hourHandScale:0.12,date: true,datePositionX:65.0,datePositionY:0.2),
        
       WatchSettings(name: "Omega Seamaster", dial: "SEMDial", secondHand: "SEMSecond", minuteHand: "SEMMinute", hourHand: "SEMHour", secondHandScale:0.39,minuteHandScale:0.11, hourHandScale:0.2),
        
        
        WatchSettings(name: "Omega Speedmaster Professional", dial: "SMDial", secondHand: "SMChr", minuteHand: "SMMinute", hourHand: "SMHour", secondHandScale: 0.3, minuteHandScale: 0.10, hourHandScale: 0.12, secondHandPositionX: -48.5, secondHandPositionY: 0.0, secondHandOnTop: false,chronograph:true, chrSecondHand:"SMChrSecond",chrMinuteHand:"SMChr",chrHourHand: "SMChr",chrMinuteDial:30, chrHourDial:12, chrSecondHandScale: 0.35, chrMinuteHandScale: 0.3, chrHourHandScale: 0.3, chrSecondPositionX: 0, chrSecondPositionY: 0, chrSecondHandOnTop: true, chrMinutePositionX: 47.5, chrMinutePositionY: 0, chrHourPositionX: 1, chrHourPositionY: -55.5),
        
        WatchSettings(name: "Tag Heuer Monaco", dial: "MonacoDial", secondHand: "MonacoChr", minuteHand: "MonacoMinute", hourHand: "MonacoHour", secondHandScale: 0.29, minuteHandScale: 0.1, hourHandScale: 0.12, secondHandPositionX: -46, secondHandPositionY: 0.0, secondHandOnTop: false, date:true, datePositionX:0, datePositionY:-99, dateColor: .white,chronograph:true, chrSecondHand:"MonacoChrSecond", chrMinuteHand:"MonacoChr", chrSecondHandScale: 0.39, chrMinuteHandScale: 0.28, chrSecondPositionX: 0, chrSecondPositionY: 0.0, chrSecondHandOnTop: true, chrMinutePositionX: 46, chrMinutePositionY: 0),
        
        
        WatchSettings(name: "Bell & Ross 01-94", dial: "0194Dial", secondHand: "0194Chr", minuteHand: "0194Minute", hourHand: "0194Hour", secondHandScale: 0.2, minuteHandScale: 0.1, hourHandScale: 0.12, secondHandPositionX: -44, secondHandPositionY: 0.0, secondHandOnTop: false, date:true, datePositionX:49, datePositionY:-58, dateColor: .white,chronograph:true, chrSecondHand:"0194Second", chrMinuteHand:"0194Chr", chrHourHand:"0194Chr",chrSecondHandScale: 0.6, chrMinuteHandScale: 0.22,chrHourHandScale:0.22, chrSecondPositionX: 0, chrSecondPositionY: 0.0, chrSecondHandOnTop: true, chrMinutePositionX: 41, chrMinutePositionY: 0,chrHourPositionX:0,chrHourPositionY:-60),
        
        WatchSettings(name: "Breitling Avenger Blackbird", dial: "ABDial", secondHand: "ABSecond", minuteHand: "ABMinute", hourHand: "ABHour",secondHandScale:0.40,minuteHandScale:0.09,hourHandScale:0.12,date: true,datePositionX:65.0,datePositionY:-1,dateColor:.white),
        
        
        WatchSettings(name: "Philippe Patek Nautilus", dial: "NauDial", secondHand: "NauSecond", minuteHand: "NauMinute", hourHand: "NauHour", secondHandScale:0.44,minuteHandScale:0.15,hourHandScale:0.12,date: true,datePositionX: 75,datePositionY:-1),
        
        WatchSettings(name: "Cartier Tank", dial: "TankDial", minuteHand: "TankMinute", hourHand: "TankHour", minuteHandScale:0.08,hourHandScale:0.14),
        
        
        WatchSettings(name: "Hermes Apple Watch", dial: "HermesDial", minuteHand: "HermesMinute", hourHand: "HermesHour",minuteHandScale:0.09,hourHandScale:0.09),
        
        WatchSettings(name: "Seiko SKX007", dial: "SKXDial", secondHand: "SKXSecond", minuteHand: "SKXMinute", hourHand: "SKXHour",secondHandScale:0.6,minuteHandScale:0.14,hourHandScale:0.15,date: true, datePositionX:78,datePositionY:0.2),
        
        WatchSettings(name: "Hublot Spirit of Big Bang", dial: "BBDial", secondHand: "BBSecond", minuteHand: "BBMinute", hourHand: "BBHour",secondHandScale:0.73,minuteHandScale:0.11,hourHandScale:0.14,date: true,datePositionX:0,datePositionY: -99,dateColor: .white),
        
        WatchSettings(name: "Rolex Daytona", dial: "DayDial", secondHand: "DayChr", minuteHand: "DayMinute", hourHand: "DayHour", secondHandScale: 0.55, minuteHandScale: 0.09, hourHandScale: 0.12, secondHandPositionX: -39, secondHandPositionY: 0.0, secondHandOnTop: false,chronograph:true, chrSecondHand:"DayChrSecond",chrMinuteHand:"DayChr",chrHourHand: "DayChr",chrMinuteDial:30, chrHourDial:12, chrSecondHandScale: 0.38, chrMinuteHandScale: 0.55, chrHourHandScale: 0.55, chrSecondPositionX: 0, chrSecondPositionY: 0, chrSecondHandOnTop: true, chrMinutePositionX: 37, chrMinutePositionY: 0, chrHourPositionX: 0, chrHourPositionY: -55.5)
        
        
        ]
    
    
    
    
    static var watchSettingsList = WatchSettingsManager.watchDataBase.sorted(by: { $0.name < $1.name })
    
    
    static var actualWatch = 0
    
    
    init() {
        
        WatchSettingsManager.watchSettingsList = WatchSettingsManager.watchSettingsList.sorted { $0.name < $1.name }
        
        
    }
}
