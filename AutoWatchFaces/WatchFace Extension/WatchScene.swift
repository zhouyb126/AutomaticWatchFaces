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
    var biColourUp : SKSpriteNode = SKSpriteNode()
    var biColourDown : SKSpriteNode = SKSpriteNode()
    
    let watch = WatchManager.actualWatch
    
    // MARK: Set the watchface
    override func sceneDidLoad() {
        
        scene?.scaleMode = .aspectFit
        if let background : SKSpriteNode = self.childNode(withName: "Dial") as? SKSpriteNode{
            dialBackground = background
            if watch.luminescent == true && WatchManager.nightMode{
                let dialName = watch.dial! + "-night"
                dialBackground.texture = SKTexture(imageNamed: dialName)
            }
            else{
                dialBackground.texture = SKTexture(imageNamed: watch.dial!)
            }
        }
        
        if let biColourUpBgr : SKSpriteNode = self.childNode(withName: "BiColourUp") as? SKSpriteNode{
            biColourUp = biColourUpBgr
            if watch.biColour != nil{
                biColourUp.color = (watch.biColour?.rotationColor)!
            }
            else{
                biColourUp.isHidden = true
            }
        }
        
        if let biColourDownBgr : SKSpriteNode = self.childNode(withName: "BiColourDown") as? SKSpriteNode{
            biColourDown = biColourDownBgr
            if watch.biColour != nil{
                biColourDown.color = (watch.biColour?.backgroundColor)!
            }
            else{
                biColourDown.isHidden = true
            }
        }
        
        
        if let secHand : SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode{
            secondHand = secHand
            
            if (watch.secHand != nil){
                if watch.luminescent == true && WatchManager.nightMode{
                    let secondHandName = (watch.secHand?.image)! + "-night"
                    secondHand.texture = SKTexture(imageNamed: secondHandName)
                }
                else{
                    secondHand.texture = SKTexture(imageNamed: (watch.secHand?.image)!)
                }
                secondHand.xScale = CGFloat((watch.secHand?.scale)!)
                secondHand.yScale = CGFloat((watch.secHand?.scale)!)
                secondHand.position = CGPoint(x: (watch.secHand?.positionX)!, y: (watch.secHand?.positionY)!)
                
                if watch.secondOnTop == true {
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
            
            if watch.minHand != nil{
                if watch.luminescent == true && WatchManager.nightMode{
                    let minuteHandName = (watch.minHand?.image)! + "-night"
                    minuteHand.texture = SKTexture(imageNamed: minuteHandName)
                }
                else{
                    minuteHand.texture = SKTexture(imageNamed: (watch.minHand?.image)!)
                }
                minuteHand.xScale = CGFloat((watch.minHand?.scale)!)
                minuteHand.yScale = CGFloat((watch.minHand?.scale)!)
                minuteHand.zPosition = 4
            }
            else {
                minuteHand.isHidden = true
            }
        }
        
        if let hrHand : SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode{
            hourHand = hrHand
            if watch.hourHand != nil{
                if watch.luminescent == true && WatchManager.nightMode{
                    let hourHandName = (watch.hourHand?.image)! + "-night"
                    hourHand.texture = SKTexture(imageNamed: hourHandName)
                }
                else{
                    hourHand.texture = SKTexture(imageNamed: (watch.hourHand?.image)!)
                }
                hourHand.xScale = CGFloat((watch.hourHand?.scale)!)
                hourHand.yScale = CGFloat((watch.hourHand?.scale)!)
                hourHand.zPosition = 3
            }
            else{
                hourHand.isHidden = true
            }
        }
        
        if let label : SKLabelNode = self.childNode(withName: "DateLabel") as? SKLabelNode{
            dateLabel = label
            
            if watch.date != nil{
                dateLabel.isHidden = false
                dateLabel.position = CGPoint(x:(watch.date?.positionX)!, y: (watch.date?.positionY)!)
                dateLabel.fontColor = watch.date?.color
                dateLabel.fontSize = CGFloat((watch.date?.fontSize)!)
                dateLabel.zRotation = CGFloat((watch.date?.rotation)!)
                dateLabel.zPosition = 1
            }
            else{
                dateLabel.isHidden = true
            }
        }
        
        
        if let SubHand1 : SKSpriteNode = self.childNode(withName: "SubHand1") as? SKSpriteNode{
            subHand1 = SubHand1
            
            if watch.chronograph?.secHand != nil{
                subHand1.texture = SKTexture(imageNamed: (watch.chronograph?.secHand?.image)!)
                subHand1.isHidden = false
                subHand1.xScale = CGFloat((watch.chronograph?.secHand?.scale)!)
                subHand1.yScale = CGFloat((watch.chronograph?.secHand?.scale)!)
                subHand1.position = CGPoint(x:(watch.chronograph?.secHand?.positionX)!, y: (watch.chronograph?.secHand?.positionY)!)
                
                if watch.chronograph?.secondOnTop == true {
                    subHand1.zPosition = 0}
                else{subHand1.zPosition = 5
                }
            }
            else if watch.grandeComplication?.monthHand != nil{
                subHand1.texture = SKTexture(imageNamed: (watch.grandeComplication?.monthHand?.image)!)
                subHand1.isHidden = false
                subHand1.xScale = CGFloat((watch.grandeComplication?.monthHand?.scale)!)
                subHand1.yScale = CGFloat((watch.grandeComplication?.monthHand?.scale)!)
                subHand1.position = CGPoint(x:(watch.grandeComplication?.monthHand?.positionX)!, y: (watch.grandeComplication?.monthHand?.positionY)!)
            }
                
                
            else if watch.gmt != nil{
                if watch.luminescent == true && WatchManager.nightMode{
                    let texture = (watch.gmt?.gmtHand.image)! + "-night"
                    subHand1.texture = SKTexture(imageNamed: (texture))
                }
                else{
                    subHand1.texture = SKTexture(imageNamed: (watch.gmt?.gmtHand.image)!)
                }
                subHand1.position.x = CGFloat((watch.gmt?.gmtHand.positionX)!)
                subHand1.position.y = CGFloat((watch.gmt?.gmtHand.positionY)!)
                SubHand1.zPosition = 2
            }
                
            else{
                subHand1.isHidden = true
            }
        }
        
        if let SubHand2 : SKSpriteNode = self.childNode(withName: "SubHand2") as? SKSpriteNode{
            subHand2 = SubHand2
            subHand2.zPosition = 2
            
            if watch.chronograph?.minuteHand != nil{
                subHand2.texture = SKTexture(imageNamed: (watch.chronograph?.minuteHand?.image)!)
                subHand2.isHidden = false
                subHand2.xScale = CGFloat((watch.chronograph?.minuteHand?.scale)!)
                subHand2.yScale = CGFloat((watch.chronograph?.minuteHand?.scale)!)
                subHand2.position = CGPoint(x:(watch.chronograph?.minuteHand?.positionX)!, y: (watch.chronograph?.minuteHand?.positionY)!)
                
            }
                
            else if watch.grandeComplication?.weekdayHand != nil{
                subHand2.texture = SKTexture(imageNamed: (watch.grandeComplication?.weekdayHand!.image)!)
                subHand2.isHidden = false
                subHand2.xScale = CGFloat((watch.grandeComplication?.weekdayHand!.scale)!)
                subHand2.yScale = CGFloat((watch.grandeComplication?.weekdayHand!.scale)!)
                subHand2.position = CGPoint(x:(watch.grandeComplication?.weekdayHand!.positionX)!, y: (watch.grandeComplication?.weekdayHand!.positionY)!)
                
            }
            else{
                subHand2.isHidden = true
            }
        }
        
        if let SubHand3 : SKSpriteNode = self.childNode(withName: "SubHand3") as? SKSpriteNode{
            subHand3 = SubHand3
            subHand3.zPosition = 1
            
            if watch.chronograph?.hourHand != nil{
                subHand3.texture = SKTexture(imageNamed: (watch.chronograph?.hourHand?.image)!)
                subHand3.isHidden = false
                subHand3.xScale = CGFloat((watch.chronograph?.hourHand?.scale)!)
                subHand3.yScale = CGFloat((watch.chronograph?.hourHand?.scale)!)
                subHand3.position = CGPoint(x:(watch.chronograph?.hourHand?.positionX)!, y: (watch.chronograph?.hourHand?.positionY)!)
                
            } else if watch.grandeComplication?.dateHand != nil{
                subHand3.texture = SKTexture(imageNamed: (watch.grandeComplication?.dateHand!.image)!)
                subHand3.isHidden = false
                subHand3.xScale = CGFloat((watch.grandeComplication?.dateHand?.scale)!)
                subHand3.yScale = CGFloat((watch.grandeComplication?.dateHand!.scale)!)
                subHand3.position = CGPoint(x:(watch.grandeComplication?.dateHand!.positionX)!, y: (watch.grandeComplication?.dateHand!.positionY)!)
                
            }
            else{
                subHand3.isHidden = true
            }
            
            
        }
        
        if let DayCycle : SKSpriteNode = self.childNode(withName: "DayCycle") as? SKSpriteNode{
            dayCycle = DayCycle
            
            if watch.dayCycle != nil{
                dayCycle.texture = SKTexture(imageNamed: (watch.dayCycle?.dial)!)
                dayCycle.isHidden = false
                dayCycle.xScale = CGFloat((watch.dayCycle?.scale)!)
                dayCycle.yScale = CGFloat((watch.dayCycle?.scale)!)
                dayCycle.position = CGPoint(x:(watch.dayCycle?.positionX)!, y: (watch.dayCycle?.positionY)!)
                
            }
            else{
                dayCycle.isHidden = true
            }
        }
        
        if let DayLabelSprite : SKSpriteNode = self.childNode(withName: "DayLabelSprite") as? SKSpriteNode{
            dayLabelSprite = DayLabelSprite
            
            if watch.day != nil{
                dayLabelSprite.isHidden = false
                dayLabelSprite.position = CGPoint(x:(watch.day?.positionX)!, y: (watch.day?.positionY)!)
                dayLabelSprite.xScale = CGFloat(watch.day!.xScale)
                dayLabelSprite.yScale = CGFloat(watch.day!.yScale)
                dayLabelSprite.zPosition = 1
                
            }
            else{
                dayLabelSprite.isHidden = true
            }
            
            
        }
        
        if let BatteryIndicator : SKSpriteNode = self.childNode(withName: "Battery") as? SKSpriteNode{
            battery = BatteryIndicator
            
            if watch.battery != nil{
                WKInterfaceDevice.current().isBatteryMonitoringEnabled = true
                battery.texture = SKTexture(imageNamed: (watch.battery?.batteryHand?.image)!)
                battery.isHidden = false
                battery.position = CGPoint(x:(watch.battery?.batteryHand?.positionX)!, y: (watch.battery?.batteryHand?.positionY)!)
                battery.xScale = CGFloat((watch.battery?.batteryHand?.scale)!)
                battery.yScale = CGFloat((watch.battery?.batteryHand?.scale)!)
                battery.zPosition = 1
                
            }
            else{
                battery.isHidden = true
                WKInterfaceDevice.current().isBatteryMonitoringEnabled = false
            }
            
        }
        
        
        if let BalanceWheel : SKSpriteNode = self.childNode(withName: "BalanceWheel") as? SKSpriteNode{
            balanceWheel  = BalanceWheel
            
            if watch.skeleton != nil {
                balanceWheel.isHidden = false
                balanceWheel.texture = SKTexture(imageNamed: (watch.skeleton?.balanceWheel)!)
                balanceWheel.zPosition = 1
            }
                
            else{
                balanceWheel.isHidden = true
            }
            
            
        }
        
        if let Tourbillion : SKSpriteNode = self.childNode(withName: "Tourbillon") as? SKSpriteNode{
            tourbillon  = Tourbillion
            
            if watch.tourbillon != nil {
                tourbillon.isHidden = false
                tourbillon.texture = SKTexture(imageNamed: (watch.tourbillon?.tourbillion)!)
                tourbillon.zPosition = 2
            }
                
            else{
                tourbillon.isHidden = true
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
        
        
        if watch.stop2Go == true{
            secondHand.zRotation = -1 * degreesToRadians(seconds*(360/58))
            if seconds >= 58{
                secondHand.zRotation = 0
            }
        }
        else{
            secondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*6)
        }
        
        if watch.date != nil{
            dateLabel.text = String(calendar.component(.day, from: date))
        }
        
        if watch.day != nil {
            dayLabelSprite.texture = SKTexture(imageNamed: (((watch.day?.getDayInString(day: (weekday-1)))!)))
        }
        
        if watch.chronograph != nil{
            
            
            if watch.chronograph?.inWork == true{
                subHand1.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9) -  watch.chronograph!.secondsChronographStarted + watch.chronograph!.secondsChronographSaved)*6)
                
                let subHand2Degrees = (minutes+(seconds/60) -  watch.chronograph!.minutesChronographStarted + watch.chronograph!.minutesChronographSaved)
                
                subHand2.zRotation = -1 * degreesToRadians(subHand2Degrees)*CGFloat((360/((watch.chronograph?.minuteDialNb)!)))
                
                subHand3.zRotation = -1 * degreesToRadians((hour*30 + minutes/2 -  watch.chronograph!.hoursChronographStarted + watch.chronograph!.hoursChronographSaved))
                
            }
            else{
                subHand1.zRotation = -1 * degreesToRadians((watch.chronograph!.secondsChronographSaved)*6)
                
                subHand2.zRotation = -1 * degreesToRadians((watch.chronograph!.minutesChronographSaved)*CGFloat((360/((watch.chronograph?.minuteDialNb)!))))
                
                subHand3.zRotation = -1 * degreesToRadians((watch.chronograph!.hoursChronographSaved))
                
            }
            
        }
        
        if watch.grandeComplication != nil{
            let month = CGFloat(calendar.component(.month, from: date))
            let weekday = CGFloat(calendar.component(.weekday, from: date))
            
            
            subHand1.zRotation = -1 * degreesToRadians((month-1)*30)
            subHand2.zRotation = -1 * degreesToRadians((weekday-1)*(360/7))
            subHand3.zRotation = -1 * degreesToRadians((day-1)*(360/31))
        }
        
        if watch.dayCycle != nil{
            dayCycle.zRotation = -1 * degreesToRadians(hour*15 + minutes/2)
            
        }
        
        
        if watch.battery != nil{
            let batteryPercentage = WKInterfaceDevice.current().batteryLevel
            
            if batteryPercentage < 0.5{
                battery.zRotation = 1 * degreesToRadians((0.5 - CGFloat(batteryPercentage))*180)
            }
            else {
                battery.zRotation = -1 * degreesToRadians((CGFloat(batteryPercentage)-0.5)*180)
            }
            
        }
        
        if watch.skeleton != nil{
            if watch.skeleton?.counterclockwise == false && (watch.skeleton?.movement)! < 3{
                balanceWheel.zRotation = -1 * degreesToRadians(8)
                watch.skeleton?.movement += 1
            }
            else {
                watch.skeleton?.counterclockwise = true
                balanceWheel.zRotation = 1 * degreesToRadians(8)
                watch.skeleton?.movement -= 1
                if watch.skeleton?.movement == 0{
                    watch.skeleton?.counterclockwise = false
                }
            }
            
        }
        
        if watch.tourbillon != nil{
            tourbillon.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*12)
        }
        
        if watch.gmt != nil{
            var timeZone = 0
            if let defaults = UserDefaults.standard.value(forKey: "timeZone"){
                timeZone = defaults as! Int
            }
            if WatchManager.inSettings{
                subHand1.zRotation = -1 * degreesToRadians((hour)*15 + (minutes)/2 + CGFloat(timeZone))
            }
            else{
                subHand1.zRotation = -1 * degreesToRadians((hour)*15 + (minutes)/2 + CGFloat(timeZone))
            }
        }
        
        if watch.biColour != nil{
            biColourUp.zRotation = -1 * degreesToRadians((minutes+(seconds/60))*6)
        }
    }
    

    
    
    func degreesToRadians(_ number:CGFloat) -> CGFloat{
        return number * .pi/180
    }
    
}






