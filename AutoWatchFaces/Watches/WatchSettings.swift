//
//  WatchSettings.swift
//  WatchFace Extension
//
//  Created by Sylvain Guillier on 01/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

struct WatchSettings {
    let name : String!
    let dial : String!
    let secondHand : String?
    let minuteHand : String?
    let hourHand : String?
    let date : Bool
    let minuteHandScale : Double?
    let secondHandScale : Double?
    let hourHandScale : Double?
    let secondHandPositionX:Double?
    let secondHandPositionY:Double?
    let secondHandOnTop : Bool?
    let datePositionX : Double?
    let datePositionY : Double?
    let dateColor: UIColor
    let chronograph: Bool
    let chrSecondHand : String?
    let chrMinuteHand: String?
    let chrHourHand: String?
    let chrSecondPositionX : Double?
    let chrSecondPositionY : Double?
    let chrSecondHandScale : Double?
    let chrSecondHandOnTop : Bool?
    let chrMinutePositionX : Double?
    let chrMinutePositionY : Double?
    let chrMinuteHandScale : Double?
    let chrHourPositionX : Double?
    let chrHourPositionY : Double?
    let chrHourHandScale : Double?
    let chrMinuteDial : Int?
    let chrHourDial : Int?
    var chronographWorking:Bool?
    
    var secondsChronographStarted: CGFloat = 0
    var secondsChronographSaved : CGFloat = 0
    
    var minutesChronographStarted: CGFloat = 0
    var minutesChronographSaved : CGFloat = 0
    
    var hoursChronographStarted: CGFloat = 0
    var hoursChronographSaved : CGFloat = 0
    
    init(name:String,dial:String,secondHand:String?=nil,minuteHand:String?=nil,hourHand:String?=nil,secondHandScale:Double?=nil,minuteHandScale:Double?=nil,hourHandScale:Double?=nil,secondHandPositionX:Double?=0,secondHandPositionY:Double?=0,secondHandOnTop:Bool? = true,date:Bool=false,datePositionX:Double?=nil,datePositionY:Double?=nil, dateColor:UIColor = .black,chronograph:Bool=false, chrSecondHand:String?=nil, chrMinuteHand:String?=nil,chrHourHand:String?=nil,chrMinuteDial:Int?=60,chrHourDial:Int?=12,chrSecondHandScale:Double?=0,chrMinuteHandScale:Double?=0,chrHourHandScale:Double?=0,chrSecondPositionX:Double? = nil,chrSecondPositionY:Double? = nil,chrSecondHandOnTop:Bool?=false,chrMinutePositionX:Double? = 0,chrMinutePositionY:Double? = 0,chrHourPositionX:Double? = 0,chrHourPositionY:Double? = 0,chronographWorking:Bool? = false) {
        self.name = name
        self.dial = dial
        self.secondHand = secondHand
        self.minuteHand = minuteHand
        self.hourHand = hourHand
        self.date = date
        self.minuteHandScale = minuteHandScale
        self.hourHandScale = hourHandScale
        self.secondHandScale = secondHandScale
        self.secondHandPositionX = secondHandPositionX
        self.secondHandPositionY = secondHandPositionY
        self.secondHandOnTop = secondHandOnTop
        self.datePositionX = datePositionX
        self.datePositionY = datePositionY
        self.dateColor = dateColor
        self.chronograph = chronograph
        self.chrSecondHand = chrSecondHand
        self.chrSecondPositionX = chrSecondPositionX
        self.chrSecondPositionY = chrSecondPositionY
        self.chrSecondHandScale = chrSecondHandScale
        self.chrSecondHandOnTop = chrSecondHandOnTop
        self.chrMinuteHand = chrMinuteHand
        self.chrHourHand = chrHourHand
        self.chrMinutePositionX = chrMinutePositionX
        self.chrMinutePositionY = chrMinutePositionY
        self.chrMinuteHandScale = chrMinuteHandScale
        self.chrHourPositionX = chrHourPositionX
        self.chrHourPositionY = chrHourPositionY
        self.chrHourHandScale = chrHourHandScale
        self.chronographWorking = chronographWorking
        self.chrMinuteDial = chrMinuteDial
        self.chrHourDial = chrHourDial
    }
}
