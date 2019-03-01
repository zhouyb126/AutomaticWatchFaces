//
//  Watch.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 12/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

class Watch{
    let id: Int?
    let name : String
    var dial : String?
    var date : WatchDate?
    var minHand : Hand?
    var secHand : Hand?
    var hourHand : Hand?
    let chronograph : Chronograph?
    let grandeComplication : GrandeComplication?
    let dayCycle :DayCycle?
    let day: Day?
    let alternative :[Watch?]
    let battery : Battery?
    let skeleton : Skeleton?
    let tourbillon : Tourbillon?
    let secondOnTop : Bool?
    let stop2Go: Bool?
    let gmt : Gmt?
    let luminescent: Bool?
    var biColour : BiColour?
    
    init(id:Int?=nil,name:String,dial:String?=nil,secHand:Hand?=nil,minHand:Hand?=nil,hourHand:Hand?=nil,date:WatchDate?=nil,chronograph:Chronograph?=nil,grandeComplication:GrandeComplication?=nil,dayCycle:DayCycle? = nil,day:Day?=nil,battery:Battery?=nil,skeleton:Skeleton?=nil,tourbillon:Tourbillon?=nil,secondOnTop:Bool? = true,stop2Go:Bool? = false,gmt:Gmt? = nil,luminescent:Bool? = false,biColour: BiColour?=nil,alternative:[Watch?]=[]) {
        self.id = id
        self.name = name
        self.date = date
        self.minHand = minHand
        self.secHand = secHand
        self.hourHand = hourHand
        self.chronograph = chronograph
        self.dial = dial
        self.grandeComplication = grandeComplication
        self.dayCycle = dayCycle
        self.day = day
        self.alternative = alternative
        self.battery = battery
        self.skeleton = skeleton
        self.tourbillon = tourbillon
        self.secondOnTop = secondOnTop
        self.stop2Go = stop2Go
        self.gmt = gmt
        self.luminescent = luminescent
        self.biColour = biColour
    }
}

// MARK: Chronograph
class Chronograph{
    var secHand: Hand?
    var minuteHand: Hand?
    var hourHand : Hand?
    let minuteDialNb : Int?
    let secondOnTop: Bool?
    
    var secondsChronographStarted: CGFloat = 0
    var secondsChronographSaved : CGFloat = 0
    
    var minutesChronographStarted: CGFloat = 0
    var minutesChronographSaved : CGFloat = 0
    
    var hoursChronographStarted: CGFloat = 0
    var hoursChronographSaved : CGFloat = 0
    
    
    var inWork:Bool = false
    
    init(secHand:Hand?=nil,minuteHand:Hand?=nil,hourHand:Hand?=nil,secondOnTop:Bool?=false,minuteDialNb : Int?=30) {
        self.secHand = secHand
        self.minuteHand = minuteHand
        self.hourHand = hourHand
        self.secondOnTop = secondOnTop
        self.minuteDialNb = minuteDialNb
    }
    
    func startChronograph(){
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        
        inWork = true
        
        secondsChronographStarted = seconds + nanoseconds/pow(10,9)
        
        
        minutesChronographStarted = minutes+(seconds/60)
        
        hoursChronographStarted = (hour*30 + minutes/2)
        
    }
    
    func stopChronograph(){
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        
        inWork = false
        
        secondsChronographSaved += (seconds + nanoseconds/pow(10,9)) - secondsChronographStarted
        
        
        minutesChronographSaved += minutes+(seconds/60) - minutesChronographStarted
        
        hoursChronographSaved += (hour*30 + minutes/2) - hoursChronographStarted
        
    }
    
    func resetChronograph(){
        inWork = false
        secondsChronographStarted = 0
        secondsChronographSaved = 0
        minutesChronographStarted = 0
        minutesChronographSaved = 0
        hoursChronographStarted = 0
        hoursChronographSaved = 0
        
    }
    
}

// MARK: Hand
class Hand{
    let image:String
    let positionX:Double
    let positionY:Double
    let scale : Double
    
    init(image:String,positionX:Double=0,positionY:Double=0,scale:Double) {
        self.image = image
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
    }
    
    
}

// MARK: WatchDate
class WatchDate{
    let positionX:Double?
    let positionY: Double
    let font : String?
    let color: UIColor
    let fontSize : Int?
    let rotation : Double?
    
    init(positionX:Double?=0.0,positionY:Double,font:String?=nil,color:UIColor,fontSize:Int?=12,rotation:Double?=0) {
        self.positionX = positionX
        self.positionY = positionY
        self.color = color
        self.fontSize = fontSize
        self.rotation = rotation
        self.font = font
    }
}

// MARK: GrandeComplication
class GrandeComplication{
    let weekdayHand : Hand?
    let monthHand : Hand?
    let dateHand: Hand?
    
    init(weekdayHand:Hand?=nil,monthHand:Hand?=nil,dateHand:Hand?=nil) {
        self.weekdayHand = weekdayHand
        self.monthHand = monthHand
        self.dateHand = dateHand
    }
}

// MARK: DayCycle
class DayCycle{
    let dial: String
    let positionX: Double
    let positionY:Double
    let scale:Double
    
    init(dial:String,positionX:Double,positionY:Double,scale:Double) {
        self.dial = dial
        self.positionX = positionX
        self.positionY = positionY
        self.scale = scale
    }
}

// MARK: Day
class Day{
    let dayPrefix:String
    let positionX:Double
    let positionY:Double
    let xScale: Double
    let yScale :Double
    
    init(dayPrefix:String,positionX:Double,positionY:Double,xScale:Double,yScale:Double) {
        self.positionX = positionX
        self.positionY = positionY
        self.xScale = xScale
        self.yScale = yScale
        self.dayPrefix = dayPrefix
    }
    
    func getDayInString(day:CGFloat) -> String{
        let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        
        return ("\(dayPrefix)\(days[Int(day)])")
    }
}

// MARK: Battery
class Battery{
    let batteryHand : Hand?
    
    init(batteryHand:Hand?=nil) {
        self.batteryHand = batteryHand
    }
}

// MARK: Skeleton
class Skeleton{
    let balanceWheel: String
    var positionX: Double?
    var positionY: Double?
    var movement = 0
    var counterclockwise = false
    
    
    
    init(balanceWheel:String,positionX:Double?=0,positionY:Double?=0){
        self.balanceWheel = balanceWheel
        self.positionX = positionX
        self.positionY = positionY
        
    }
    
}

// MARK: Tourbillon
class Tourbillon{
    let tourbillion : String
    
    init(tourbillion:String) {
        self.tourbillion = tourbillion
    }
}

// MARK: Gmt
class Gmt{
    let gmtHand : Hand
    
    
    init(gmtHand : Hand) {
        self.gmtHand = gmtHand
    }
}

// MARK: BiColour
class BiColour{
    var backgroundColor : UIColor
    var rotationColor : UIColor
    
    init(backgroundColor: UIColor = UIColor.black, rotationColor: UIColor = UIColor.white){
        self.backgroundColor = backgroundColor
        self.rotationColor = rotationColor
    }
}









