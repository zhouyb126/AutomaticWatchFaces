//
//  WatchScene.swift
//  WatchFace Extension
//
//  Created by Sylvain Guillier on 27/12/2018.
//  Copyright © 2018 Sylvain Guillier. All rights reserved.
//

import SpriteKit
import WatchKit

class WatchScene: SKScene {
    var dialBackground : SKSpriteNode = SKSpriteNode()
    var secondHand : SKSpriteNode = SKSpriteNode()
    var minuteHand : SKSpriteNode = SKSpriteNode()
    var hourHand : SKSpriteNode = SKSpriteNode()
    var dateLabel : SKLabelNode = SKLabelNode()
    var subHand1 : SKSpriteNode = SKSpriteNode()
    var subHand2 : SKSpriteNode = SKSpriteNode()
    var subHand3 : SKSpriteNode = SKSpriteNode()
    var dayCycle : SKSpriteNode = SKSpriteNode()
    var dayLabelSprite :  SKSpriteNode = SKSpriteNode()
    var battery : SKSpriteNode = SKSpriteNode()
    var balanceWheel : SKSpriteNode = SKSpriteNode()
    var tourbillon : SKSpriteNode = SKSpriteNode()
    var backgroundLayer : SKSpriteNode = SKSpriteNode()
    var foregroundLayer : SKSpriteNode = SKSpriteNode()
    var gmtHand : SKSpriteNode = SKSpriteNode()
    var topLayer : SKSpriteNode = SKSpriteNode()
    var nightLayer : SKSpriteNode = SKSpriteNode()
    
    
    let watch = WatchManager.getActualWatch()
    
    // MARK: Set the watchface
    override func sceneDidLoad() {
        scene?.scaleMode = .aspectFit
        if let dial : SKSpriteNode = self.childNode(withName: "Dial") as? SKSpriteNode{
            dialBackground = dial
            if watch.getLuminescent() == true && WatchManager.isNightModeEnable(){
                let dialName = watch.getDialName()! + "-night"
                dialBackground.texture = SKTexture(imageNamed: dialName)
            }
            else{
                if var texture = watch.getDialName(){
                    // DuoTones dials example are not without background
                    if texture == "DuoTDial-1"{ texture = "DuoTDial-3"}
                    else if texture == "DuoTDial"{ texture = "DuoTDial-2"}
                    dialBackground.texture = SKTexture(imageNamed: texture)
                }
            }
            
            if watch.getDialName() == nil{
                dialBackground.isHidden = true
            }
        }
        
        if let biColourUpBgr : SKSpriteNode = self.childNode(withName: "Foreground") as? SKSpriteNode{
            foregroundLayer = biColourUpBgr
            if watch.getBiColour() != nil{
                var upColor = [Float]()
                if watch.isCustomizable()!{
                    upColor = WatchManager.getForegroundColor()
                }
                else{
                    upColor = (watch.getBiColour()?.getForegroundColor())!
                }
                print(upColor)
                foregroundLayer.color = UIColor(red: CGFloat(upColor[0]), green: CGFloat(upColor[1]), blue: CGFloat(upColor[2]), alpha: 1.0)
            }
                
            else{
                foregroundLayer.isHidden = true
            }
        }
        
        if let biColourDownBgr : SKSpriteNode = self.childNode(withName: "Background") as? SKSpriteNode{
            backgroundLayer = biColourDownBgr
            if watch.isCustomizable()!{
                backgroundLayer.color = UIColor(red: CGFloat((WatchManager.getBackgroundColor()[0])), green: CGFloat((WatchManager.getBackgroundColor()[1])), blue: CGFloat((WatchManager.getBackgroundColor()[2])), alpha: 1.0)
                
            }
            else if watch.getBiColour() != nil{
                let downColor = watch.getBiColour()?.getBackgroundColor()
                backgroundLayer.color =
                    UIColor(red: CGFloat((downColor![0])), green: CGFloat((downColor![1])), blue: CGFloat((downColor![2])), alpha: 1.0)
            }
            else{
                backgroundLayer.isHidden = true
            }
        }
        
        
        if let secHand : SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode{
            secondHand = secHand
            
            if (watch.getSecondHand() != nil){
                if watch.getLuminescent() == true && WatchManager.isNightModeEnable(){
                    let secondHandName = (watch.getSecondHand()?.getImageName())! + "-night"
                    secondHand.texture = SKTexture(imageNamed: secondHandName)
                }
                else{
                    secondHand.texture = SKTexture(imageNamed: (watch.getSecondHand()?.getImageName())!)
                }
                secondHand.xScale = CGFloat((watch.getSecondHand()?.getScale())!)
                secondHand.yScale = CGFloat((watch.getSecondHand()?.getScale())!)
                secondHand.position = CGPoint(x: (watch.getSecondHand()?.getHandPosition()[0])!, y: (watch.getSecondHand()?.getHandPosition()[1])!)
                
                if watch.getSecondOnTop() == true {
                    secondHand.zPosition = 5}
                else{secondHand.zPosition = 0
                }
                
                
            }
            else{
                secondHand.isHidden = true
            }
        }
        
        if let minHand : SKSpriteNode = self.childNode(withName: "MinuteHand") as? SKSpriteNode{
            minuteHand  = minHand
            
            if watch.getMinuteHand() != nil{
                if watch.getLuminescent() == true && WatchManager.isNightModeEnable(){
                    let minuteHandName = (watch.getMinuteHand()?.getImageName())! + "-night"
                    minuteHand.texture = SKTexture(imageNamed: minuteHandName)
                }
                else{
                    minuteHand.texture = SKTexture(imageNamed: (watch.getMinuteHand()?.getImageName())!)
                }
                minuteHand.xScale = CGFloat((watch.getMinuteHand()?.getScale())!)
                minuteHand.yScale = CGFloat((watch.getMinuteHand()?.getScale())!)
                minuteHand.zPosition = 4
            }
            else {
                minuteHand.isHidden = true
            }
        }
        
        if let hrHand : SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode{
            hourHand = hrHand
            if watch.getHourHand() != nil{
                if watch.getLuminescent() == true && WatchManager.isNightModeEnable(){
                    let hourHandName = (watch.getHourHand()?.getImageName())! + "-night"
                    hourHand.texture = SKTexture(imageNamed: hourHandName)
                }
                else{
                    hourHand.texture = SKTexture(imageNamed: (watch.getHourHand()?.getImageName())!)
                }
                hourHand.xScale = CGFloat((watch.getHourHand()?.getScale())!)
                hourHand.yScale = CGFloat((watch.getHourHand()?.getScale())!)
                hourHand.zPosition = 3
            }
            else{
                hourHand.isHidden = true
            }
        }
        
        if let label : SKLabelNode = self.childNode(withName: "DateLabel") as? SKLabelNode{
            dateLabel = label
            
            if watch.getDate() != nil{
                dateLabel.isHidden = false
                dateLabel.position = CGPoint(x:(watch.getDate()?.getPosition()[0])!, y: (watch.getDate()?.getPosition()[1])!)
                if watch.getDate()?.getFontName() != nil{
                    dateLabel.fontName = watch.getDate()?.getFontName()
                }
                else{
                    dateLabel.fontName = "Helvetica Neue Bold"
                }
                dateLabel.fontColor = UIColor(red: CGFloat((watch.getDate()?.getColor()[0])!), green: CGFloat((watch.getDate()?.getColor()[1])!), blue: CGFloat((watch.getDate()?.getColor()[2])!), alpha: 1.0)
                dateLabel.fontSize = CGFloat((watch.getDate()?.getFontSize())!)
                dateLabel.zRotation = CGFloat((watch.getDate()?.getFontRotation())!)
                dateLabel.zPosition = 1
                dateLabel.horizontalAlignmentMode = .center
            }
            else{
                dateLabel.isHidden = true
            }
        }
        
        
        if let SubHand1 : SKSpriteNode = self.childNode(withName: "SubHand1") as? SKSpriteNode{
            subHand1 = SubHand1
            
            if watch.getChronograph()?.getSecondHand() != nil{
                subHand1.texture = SKTexture(imageNamed: (watch.getChronograph()?.getSecondHand()?.getImageName())!)
                subHand1.isHidden = false
                subHand1.xScale = CGFloat((watch.getChronograph()?.getSecondHand()?.getScale())!)
                subHand1.yScale = CGFloat((watch.getChronograph()?.getSecondHand()?.getScale())!)
                subHand1.position = CGPoint(x:(watch.getChronograph()?.getSecondHand()?.getHandPosition()[0])!, y: (watch.getChronograph()?.getSecondHand()?.getHandPosition()[1])!)
                
                if watch.getChronograph()?.getSecondOnTop() == true {
                    subHand1.zPosition = 0}
                else{subHand1.zPosition = 5
                }
            }
            else if watch.getGrandeComplication()?.getMonthHand() != nil{
                subHand1.texture = SKTexture(imageNamed: (watch.getGrandeComplication()?.getMonthHand()?.getImageName())!)
                subHand1.isHidden = false
                subHand1.xScale = CGFloat((watch.getGrandeComplication()?.getMonthHand()?.getScale())!)
                subHand1.yScale = CGFloat((watch.getGrandeComplication()?.getMonthHand()?.getScale())!)
                subHand1.position = CGPoint(x:(watch.getGrandeComplication()?.getMonthHand()?.getHandPosition()[0])!, y: ((watch.getGrandeComplication()?.getMonthHand()?.getHandPosition()[1])!))
            }
                
            else{
                subHand1.isHidden = true
            }
        }
        
        if let SubHand2 : SKSpriteNode = self.childNode(withName: "SubHand2") as? SKSpriteNode{
            subHand2 = SubHand2
            subHand2.zPosition = 0
            
            if watch.getChronograph()?.getMinuteHand() != nil{
                subHand2.texture = SKTexture(imageNamed: (watch.getChronograph()?.getMinuteHand()?.getImageName())!)
                subHand2.isHidden = false
                subHand2.xScale = CGFloat((watch.getChronograph()?.getMinuteHand()?.getScale())!)
                subHand2.yScale = CGFloat((watch.getChronograph()?.getMinuteHand()?.getScale())!)
                subHand2.position = CGPoint(x:(watch.getChronograph()?.getMinuteHand()?.getHandPosition()[0])!, y: (watch.getChronograph()?.getMinuteHand()?.getHandPosition()[1])!)
                
            }
                
            else if watch.getGrandeComplication()?.getWeekdayHand() != nil{
                subHand2.texture = SKTexture(imageNamed: (watch.getGrandeComplication()?.getWeekdayHand()!.getImageName())!)
                subHand2.isHidden = false
                subHand2.xScale = CGFloat((watch.getGrandeComplication()?.getWeekdayHand()!.getScale())!)
                subHand2.yScale = CGFloat((watch.getGrandeComplication()?.getWeekdayHand()!.getScale())!)
                subHand2.position = CGPoint(x:(watch.getGrandeComplication()?.getWeekdayHand()!.getHandPosition()[0])!, y: (watch.getGrandeComplication()?.getWeekdayHand()!.getHandPosition()[1])!)
                
            }
            else{
                subHand2.isHidden = true
            }
        }
        
        if let SubHand3 : SKSpriteNode = self.childNode(withName: "SubHand3") as? SKSpriteNode{
            subHand3 = SubHand3
            subHand3.zPosition = 0
            
            if watch.getChronograph()?.getHourHand() != nil{
                subHand3.texture = SKTexture(imageNamed: (watch.getChronograph()?.getHourHand()?.getImageName())!)
                subHand3.isHidden = false
                subHand3.xScale = CGFloat((watch.getChronograph()?.getHourHand()?.getScale())!)
                subHand3.yScale = CGFloat((watch.getChronograph()?.getHourHand()?.getScale())!)
                subHand3.position = CGPoint(x:(watch.getChronograph()?.getHourHand()?.getHandPosition()[0])!, y: (watch.getChronograph()?.getHourHand()?.getHandPosition()[1])!)
                
            } else if watch.getGrandeComplication()?.getDateHand() != nil{
                subHand3.texture = SKTexture(imageNamed: (watch.getGrandeComplication()?.getDateHand()!.getImageName())!)
                subHand3.isHidden = false
                subHand3.xScale = CGFloat((watch.getGrandeComplication()?.getDateHand()?.getScale())!)
                subHand3.yScale = CGFloat((watch.getGrandeComplication()?.getDateHand()!.getScale())!)
                subHand3.position = CGPoint(x:(watch.getGrandeComplication()?.getDateHand()!.getHandPosition()[0])!, y: (watch.getGrandeComplication()?.getDateHand()!.getHandPosition()[1])!)
                
            }
            else{
                subHand3.isHidden = true
            }
            
            
        }
        
        if let DayCycle : SKSpriteNode = self.childNode(withName: "DayCycle") as? SKSpriteNode{
            dayCycle = DayCycle
            
            if watch.getDayCycle() != nil{
                dayCycle.texture = SKTexture(imageNamed: (watch.getDayCycle()?.getDialName())!)
                dayCycle.isHidden = false
                dayCycle.xScale = CGFloat((watch.getDayCycle()?.getScale())!)
                dayCycle.yScale = CGFloat((watch.getDayCycle()?.getScale())!)
                dayCycle.position = CGPoint(x:(watch.getDayCycle()?.getPosition()[0])!, y: (watch.getDayCycle()?.getPosition()[1])!)
                
            }
            else{
                dayCycle.isHidden = true
            }
        }
        
        if let DayLabelSprite : SKSpriteNode = self.childNode(withName: "DayLabelSprite") as? SKSpriteNode{
            dayLabelSprite = DayLabelSprite
            
            if watch.getDay() != nil{
                dayLabelSprite.isHidden = false
                dayLabelSprite.position = CGPoint(x:(watch.getDay()?.getPosition()[0])!, y: (watch.getDay()?.getPosition()[1])!)
                dayLabelSprite.xScale = CGFloat(watch.getDay()!.getScale()[0])
                dayLabelSprite.yScale = CGFloat(watch.getDay()!.getScale()[1])
                dayLabelSprite.zPosition = 1
                
            }
            else{
                dayLabelSprite.isHidden = true
            }
            
            
        }
        
        if let BatteryIndicator : SKSpriteNode = self.childNode(withName: "Battery") as? SKSpriteNode{
            battery = BatteryIndicator
            
            if watch.getBattery() != nil{
                WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
                battery.texture = SKTexture(imageNamed: (watch.getBattery()?.getBatteryHand()?.getImageName())!)
                battery.isHidden = false
                battery.position = CGPoint(x:(watch.getBattery()?.getBatteryHand()?.getHandPosition()[0])!, y: (watch.getBattery()?.getBatteryHand()?.getHandPosition()[1])!)
                battery.xScale = CGFloat((watch.getBattery()?.getBatteryHand()?.getScale())!)
                battery.yScale = CGFloat((watch.getBattery()?.getBatteryHand()?.getScale())!)
                battery.zPosition = 1
                
            }
            else{
                battery.isHidden = true
                WKInterfaceDevice.current().isBatteryMonitoringEnabled = false
            }
            
        }
        
        
        if let BalanceWheel : SKSpriteNode = self.childNode(withName: "BalanceWheel") as? SKSpriteNode{
            balanceWheel  = BalanceWheel
            
            if watch.getSkeleton() != nil {
                balanceWheel.isHidden = false
                balanceWheel.texture = SKTexture(imageNamed: (watch.getSkeleton()?.getBalanceWheelName())!)
                balanceWheel.position = CGPoint(x: (watch.getSkeleton()?.getPosition()[0])!, y: (watch.getSkeleton()?.getPosition()[1])!)
                balanceWheel.xScale = CGFloat((watch.getSkeleton()?.getScale())!)
                balanceWheel.yScale = CGFloat((watch.getSkeleton()?.getScale())!)
                balanceWheel.zPosition = 1
            }
                
            else{
                balanceWheel.isHidden = true
            }
            
            
        }
        
        if let Tourbillion : SKSpriteNode = self.childNode(withName: "Tourbillon") as? SKSpriteNode{
            tourbillon  = Tourbillion
            
            if watch.getTourbillon() != nil {
                tourbillon.isHidden = false
                tourbillon.texture = SKTexture(imageNamed: (watch.getTourbillon()?.getTourbillonName())!)
                tourbillon.zPosition = 2
            }
                
            else{
                tourbillon.isHidden = true
            }
            
            
        }
        
        if let gmtHd : SKSpriteNode = self.childNode(withName: "GmtHand") as? SKSpriteNode{
            gmtHand = gmtHd
            if watch.getGmt() != nil{
                if watch.getLuminescent() == true && WatchManager.isNightModeEnable(){
                    let texture = (watch.getGmt()?.getGmtHand().getImageName())! + "-night"
                    gmtHand.texture = SKTexture(imageNamed: (texture))
                }
                else{
                    gmtHand.texture = SKTexture(imageNamed: (watch.getGmt()?.getGmtHand().getImageName())!)
                }
                gmtHand.position.x = CGFloat((watch.getGmt()?.getGmtHand().getHandPosition()[0])!)
                gmtHand.position.y = CGFloat((watch.getGmt()?.getGmtHand().getHandPosition()[1])!)
                gmtHand.zPosition = 1
                gmtHand.xScale = CGFloat((watch.getGmt()?.getGmtHand().getScale())!)
                gmtHand.yScale = CGFloat((watch.getGmt()?.getGmtHand().getScale())!)
            }
            else {
                gmtHand.isHidden = true
            }
            
            
        }
        
        
        
        if let tpLayer : SKSpriteNode = self.childNode(withName: "TopLayer") as? SKSpriteNode{
            topLayer = tpLayer
            if watch.getTopLayer() != nil{
                topLayer.texture = SKTexture(imageNamed: (watch.getTopLayer()?.getImageName())!)
                topLayer.position.x = CGFloat((watch.getTopLayer()?.getPosition()[0])!)
                topLayer.position.y = CGFloat((watch.getTopLayer()?.getPosition()[1])!)
                topLayer.xScale = CGFloat(watch.getTopLayer()!.getScale())
                topLayer.yScale = CGFloat(watch.getTopLayer()!.getScale())
            }
            else{
                topLayer.isHidden = true
            }
        }
        
        if let nghtLayer : SKSpriteNode = self.childNode(withName: "NightLayer") as? SKSpriteNode{
            nightLayer = nghtLayer
            if watch.getLuminescent()! && WatchManager.isNightModeEnable(){
                print("NightModeActive")
            }
            else{
                nightLayer.isHidden = true
            }
        }
    }
    
    
    
    // MARK: Update
    
    override func update(_ currentTime: TimeInterval) {
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        let weekday = CGFloat(calendar.component(.weekday, from: date))
        let day = CGFloat(calendar.component(.day, from: date))
        
        
        minuteHand.zRotation = -1 * degreesToRadians((minutes+(seconds/60))*6)
        hourHand.zRotation = -1 * degreesToRadians(hour*30 + minutes/2)
        
        if WatchManager.isQuartzModeActive() == true{
            if watch.getStop2Go() == true{
                secondHand.zRotation = -1 * degreesToRadians(seconds*(360/58))
                if seconds >= 58{
                    secondHand.zRotation = 0
                }
            }
            else {
                secondHand.zRotation = -1 * degreesToRadians(seconds*(360/60))
            }
        }
            
        else{
            if watch.getStop2Go() == true{
                secondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*(360/58))
                if seconds >= 58{
                    secondHand.zRotation = 0
                }
            }
            else{
                secondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*6)
            }
        }
        
        if watch.getDate() != nil{
            dateLabel.text = String(calendar.component(.day, from: date))
        }
        
        if watch.getDay() != nil {
            dayLabelSprite.texture = SKTexture(imageNamed: (((watch.getDay()?.getDayInString(day: (Int(weekday-1))))!)))
        }
        
        if watch.getChronograph() != nil{
            
            if (WatchManager.ChronographIsWorking()){
                subHand1.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9) -  WatchManager.getSecondsChronographStarted() + WatchManager.getSecondsChronographSaved())*6)
                
                let subHand2Degrees = (minutes+(seconds/60) -  WatchManager.getMinutesChronographStarted() + WatchManager.getMinutesChronographSaved())
                
                subHand2.zRotation = -1 * degreesToRadians(subHand2Degrees)*CGFloat((360/((watch.getChronograph()?.getMinuteDialNumber())!)))
                
                subHand3.zRotation = -1 * degreesToRadians((hour*30 + minutes/2 -  WatchManager.getHoursChronographStarted() + WatchManager.getHoursChronographSaved()))
                
            }
            else{
                subHand1.zRotation = -1 * degreesToRadians((WatchManager.getSecondsChronographSaved())*6)
                
                subHand2.zRotation = -1 * degreesToRadians((WatchManager.getMinutesChronographSaved())*CGFloat((360/((watch.getChronograph()!.getMinuteDialNumber())!))))
                
                subHand3.zRotation = -1 * degreesToRadians((WatchManager.getHoursChronographSaved()))
                
            }
            
        }
        
        if watch.getGrandeComplication() != nil{
            let month = CGFloat(calendar.component(.month, from: date))
            let weekday = CGFloat(calendar.component(.weekday, from: date))
            
            
            subHand1.zRotation = -1 * degreesToRadians((month-1)*30)
            subHand2.zRotation = -1 * degreesToRadians((weekday-1)*(360/7))
            subHand3.zRotation = -1 * degreesToRadians((day-1)*(360/31))
        }
        
        if watch.getDayCycle() != nil{
            dayCycle.zRotation = -1 * degreesToRadians(hour*15 + minutes/2)
            
        }
        
        
        if watch.getBattery() != nil{
            let batteryPercentage = WKInterfaceDevice.current().batteryLevel
            
            if batteryPercentage < 0.5{
                battery.zRotation = 1 * degreesToRadians((0.5 - CGFloat(batteryPercentage))*180)
            }
            else {
                battery.zRotation = -1 * degreesToRadians((CGFloat(batteryPercentage)-0.5)*180)
            }
            
        }
        
        if watch.getSkeleton() != nil{
            if watch.getSkeleton()?.getIfCounterClockwiseRotation() == false && (watch.getSkeleton()?.getMovement())! < 3{
                balanceWheel.zRotation = -1 * degreesToRadians(8)
                watch.getSkeleton()?.setMovement(value: (watch.getSkeleton()?.getMovement())!+1)
            }
            else {
                watch.getSkeleton()?.setCounterClockWiseRotation(value: true)
                balanceWheel.zRotation = 1 * degreesToRadians(8)
                watch.getSkeleton()?.setMovement(value: (watch.getSkeleton()?.getMovement())!-1)
                if watch.getSkeleton()?.getMovement() == 0{
                    watch.getSkeleton()?.setCounterClockWiseRotation(value: false)
                }
            }
            
        }
        
        if watch.getTourbillon() != nil{
            tourbillon.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*12)
        }
        
        if watch.getGmt() != nil{
            let timeZone = WatchManager.getTimeZone()
            if WatchManager.isInGmtSettings(){
                gmtHand.zRotation = -1 * degreesToRadians((hour)*30 + (minutes)/2 + CGFloat(timeZone))
            }
            else{
                gmtHand.zRotation = -1 * degreesToRadians((hour)*30 + (minutes)/2 + CGFloat(timeZone))
            }
        }
        
        if watch.getBiColour() != nil{
            foregroundLayer.zRotation = -1 * degreesToRadians((minutes+(seconds/60))*6)
        }
    }
    
    
    
    func degreesToRadians(_ number:CGFloat) -> CGFloat{
        return number * .pi/180
    }

    
}






