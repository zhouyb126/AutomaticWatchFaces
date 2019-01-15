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
    
    
    let watch = WatchManager.actualWatch
    
    override func sceneDidLoad() {
        
        scene?.scaleMode = .aspectFit
        if let secHand : SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode{
            secondHand = secHand
            if (watch.secHand != nil){
                secondHand.texture = SKTexture(imageNamed: (watch.secHand?.image)!)
                secondHand.xScale = CGFloat((watch.secHand?.scale)!)
                secondHand.yScale = CGFloat((watch.secHand?.scale)!)
                secondHand.position = CGPoint(x: (watch.secHand?.positionX)!, y: (watch.secHand?.positionY)!)
                
                if watch.chronograph?.secondOnTop == true {
                    secondHand.zPosition = 0}
                else{secondHand.zPosition = 2
                }
                
                
            }
            else{
                secondHand.isHidden = true
            }
        }
        
        if let minHand : SKSpriteNode = self.childNode(withName: "MinuteHand") as? SKSpriteNode{
            minuteHand  = minHand
            
            if watch.minHand != nil{
                minuteHand.texture = SKTexture(imageNamed: (watch.minHand?.image)!)
                minuteHand.xScale = CGFloat((watch.minHand?.scale)!)
                minuteHand.yScale = CGFloat((watch.minHand?.scale)!)
            }
            else {
                minuteHand.isHidden = true
            }
        }
        
        if let hrHand : SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode{
            hourHand = hrHand
            if watch.hourHand != nil{
                hourHand.texture = SKTexture(imageNamed: (watch.hourHand?.image)!)
                hourHand.xScale = CGFloat((watch.hourHand?.scale)!)
                hourHand.yScale = CGFloat((watch.hourHand?.scale)!)
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
            }
            else{
                dateLabel.isHidden = true
            }
        }
        
        if let background : SKSpriteNode = self.childNode(withName: "Background") as? SKSpriteNode{
            dialBackground = background
            dialBackground.texture = SKTexture(imageNamed: watch.dial!)
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
                    subHand1.zPosition = 2}
                else{subHand1.zPosition = 0
                }
            }
            else if watch.grandeComplication?.monthHand != nil{
                subHand1.texture = SKTexture(imageNamed: (watch.grandeComplication?.monthHand?.image)!)
                subHand1.isHidden = false
                subHand1.xScale = CGFloat((watch.grandeComplication?.monthHand?.scale)!)
                subHand1.yScale = CGFloat((watch.grandeComplication?.monthHand?.scale)!)
                subHand1.position = CGPoint(x:(watch.grandeComplication?.monthHand?.positionX)!, y: (watch.grandeComplication?.monthHand?.positionY)!)
            }
            else{
                subHand1.isHidden = true
            }
        }
        
        if let SubHand2 : SKSpriteNode = self.childNode(withName: "SubHand2") as? SKSpriteNode{
            subHand2 = SubHand2
            
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
                
            }
            else{
                dayLabelSprite.isHidden = true
            }
            
            
        }
        
        
        
    }
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        let weekday = CGFloat(calendar.component(.weekday, from: date))
        
        secondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*6)
        minuteHand.zRotation = -1 * degreesToRadians((minutes+(seconds/60))*6)
        hourHand.zRotation = -1 * degreesToRadians(hour*30 + minutes/2)
        
        
        if watch.date != nil{
            dateLabel.text = String(calendar.component(.day, from: date))
        }
        
        if watch.day != nil {
            dayLabelSprite.texture = SKTexture(imageNamed: (((watch.day?.getDayInString(day: (weekday-1)))!)))
        }
        
        if WatchManager.actualWatch.chronograph != nil{
            
            if WatchManager.actualWatch.chronograph?.inWork == true{
                subHand1.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9) -  WatchManager.actualWatch.chronograph!.secondsChronographStarted + WatchManager.actualWatch.chronograph!.secondsChronographSaved)*6)
                
                subHand2.zRotation = -1 * degreesToRadians((minutes+(seconds/60) -  WatchManager.actualWatch.chronograph!.minutesChronographStarted + WatchManager.actualWatch.chronograph!.minutesChronographSaved)*12)
                
                subHand3.zRotation = -1 * degreesToRadians((hour*30 + minutes/2 -  WatchManager.actualWatch.chronograph!.hoursChronographStarted + WatchManager.actualWatch.chronograph!.hoursChronographSaved))
                
            }
            else{
                subHand1.zRotation = -1 * degreesToRadians((WatchManager.actualWatch.chronograph!.secondsChronographSaved)*6)
                
                subHand2.zRotation = -1 * degreesToRadians((WatchManager.actualWatch.chronograph!.minutesChronographSaved)*12)
                
                subHand3.zRotation = -1 * degreesToRadians((WatchManager.actualWatch.chronograph!.hoursChronographSaved))
            }
            
        }
        
        if WatchManager.actualWatch.grandeComplication != nil{
            let month = CGFloat(calendar.component(.month, from: date))
            let weekday = CGFloat(calendar.component(.weekday, from: date))
            let day = CGFloat(calendar.component(.day, from: date))
            
            
            subHand1.zRotation = -1 * degreesToRadians((month-1)*30)
            subHand2.zRotation = -1 * degreesToRadians((weekday-1)*(360/7))
            subHand3.zRotation = -1 * degreesToRadians((day-1)*12)
        }
        
        if WatchManager.actualWatch.dayCycle != nil{
            dayCycle.zRotation = -1 * degreesToRadians(hour*15 + minutes/2)
            
        }
        
        
        
        
    }
    
    
    func degreesToRadians(_ number:CGFloat) -> CGFloat{
        return number * .pi/180
    }
    
}






