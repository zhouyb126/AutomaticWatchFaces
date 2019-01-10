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
    var dayLabel : SKLabelNode = SKLabelNode()
    var chrSecondHand : SKSpriteNode = SKSpriteNode()
    var chrMinuteHand : SKSpriteNode = SKSpriteNode()
    var chrHourHand : SKSpriteNode = SKSpriteNode()
    
    let watch = WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch]
    
    override func sceneDidLoad() {
        
        scene?.scaleMode = .aspectFit
        
        if let secHand : SKSpriteNode = self.childNode(withName: "SecondHand") as? SKSpriteNode{
            secondHand = secHand
            if watch.secondHand?.isEmpty == false{
                secondHand.texture = SKTexture(imageNamed: watch.secondHand!)
                secondHand.xScale = CGFloat(watch.secondHandScale!)
                secondHand.yScale = CGFloat(watch.secondHandScale!)
                secondHand.position = CGPoint(x: watch.secondHandPositionX!, y: watch.secondHandPositionY!)
                
                if watch.secondHandOnTop == true {
                    secondHand.zPosition = 1}
                else{secondHand.zPosition = -1
                }
            }
            else{
                secondHand.isHidden = true
            }
        }
        
        if let minHand : SKSpriteNode = self.childNode(withName: "MinuteHand") as? SKSpriteNode{
            minuteHand  = minHand
            
            if watch.minuteHand?.isEmpty == false{
                minuteHand.texture = SKTexture(imageNamed: watch.minuteHand!)
                minuteHand.xScale = CGFloat(watch.minuteHandScale!)
                minuteHand.yScale = CGFloat(watch.minuteHandScale!)
            }
            else {
                minuteHand.isHidden = true
            }
        }
        
        if let hrHand : SKSpriteNode = self.childNode(withName: "HourHand") as? SKSpriteNode{
            hourHand = hrHand
            if watch.hourHand?.isEmpty == false{
                hourHand.texture = SKTexture(imageNamed: watch.hourHand!)
                hourHand.xScale = CGFloat(watch.hourHandScale!)
                hourHand.yScale = CGFloat(watch.hourHandScale!)
            }
            else{
                hourHand.isHidden = true
            }
        }
        
        if let label : SKLabelNode = self.childNode(withName: "DateLabel") as? SKLabelNode{
            dayLabel = label
            
            if watch.date == true{
                dayLabel.isHidden = false
                dayLabel.position = CGPoint(x:watch.datePositionX!, y: watch.datePositionY!)
                dayLabel.fontColor = watch.dateColor
            }
            else{
                dayLabel.isHidden = true
            }
        }
        
        if let background : SKSpriteNode = self.childNode(withName: "Background") as? SKSpriteNode{
            dialBackground = background
            dialBackground.texture = SKTexture(imageNamed: watch.dial)
        }
        
        
        if let chrSecHand : SKSpriteNode = self.childNode(withName: "ChrSecondHand") as? SKSpriteNode{
            chrSecondHand = chrSecHand
            
            if watch.chrSecondHand?.isEmpty == false{
                chrSecondHand.texture = SKTexture(imageNamed: watch.chrSecondHand!)
                chrSecondHand.isHidden = false
                chrSecondHand.xScale = CGFloat(watch.chrSecondHandScale!)
                chrSecondHand.yScale = CGFloat(watch.chrSecondHandScale!)
                chrSecondHand.position = CGPoint(x:watch.chrSecondPositionX!, y: watch.chrSecondPositionY!)
            }
            else{
                chrSecondHand.isHidden = true
            }
            if watch.chrSecondHandOnTop == true {
                chrSecondHand.zPosition = 1}
            else{chrSecondHand.zPosition = -1
            }
        }
        
        if let chrMinHand : SKSpriteNode = self.childNode(withName: "ChrMinuteHand") as? SKSpriteNode{
            chrMinuteHand = chrMinHand
            
            if watch.chrMinuteHand?.isEmpty == false{
                chrMinuteHand.texture = SKTexture(imageNamed: watch.chrMinuteHand!)
                chrMinuteHand.isHidden = false
                chrMinuteHand.xScale = CGFloat(watch.chrMinuteHandScale!)
                chrMinuteHand.yScale = CGFloat(watch.chrMinuteHandScale!)
                chrMinuteHand.position = CGPoint(x:watch.chrMinutePositionX!, y: watch.chrMinutePositionY!)
            }
            else{
                chrMinuteHand.isHidden = true
            }
        }
        
        if let chrHrHand : SKSpriteNode = self.childNode(withName: "ChrHourHand") as? SKSpriteNode{
            chrHourHand = chrHrHand
            
            if watch.chrHourHand?.isEmpty == false{
                chrHourHand.texture = SKTexture(imageNamed: watch.chrHourHand!)
                chrHourHand.isHidden = false
                chrHourHand.xScale = CGFloat(watch.chrHourHandScale!)
                chrHourHand.yScale = CGFloat(watch.chrHourHandScale!)
                chrHourHand.position = CGPoint(x:watch.chrHourPositionX!, y: watch.chrHourPositionY!)
            }
            else{
                chrHourHand.isHidden = true
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
        let chrMinuteFactor = CGFloat(360/WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chrMinuteDial!)
        
        secondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9))*6)
        minuteHand.zRotation = -1 * degreesToRadians((minutes+(seconds/60))*6)
        hourHand.zRotation = -1 * degreesToRadians(hour*30 + minutes/2)
        dayLabel.text = String(calendar.component(.day, from: date))
        if WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronograph == true{
            
            if WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronographWorking! == true{
                chrSecondHand.zRotation = -1 * degreesToRadians((seconds + nanoseconds/pow(10,9) -  WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographStarted + WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographSaved)*6)
                
                chrMinuteHand.zRotation = -1 * degreesToRadians((minutes+(seconds/60) -  WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographStarted + WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographSaved)*chrMinuteFactor)
                
                chrHourHand.zRotation = -1 * degreesToRadians((hour*30 + minutes/2 -  WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographStarted + WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographSaved))
                
            }
            else{
                chrSecondHand.zRotation = -1 * degreesToRadians((WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographSaved)*6)
                
                chrMinuteHand.zRotation = -1 * degreesToRadians((WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographSaved)*chrMinuteFactor)
                
                chrHourHand.zRotation = -1 * degreesToRadians((WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographSaved))
            }
            
        }
        
        
        
        
    }
    
    
    func degreesToRadians(_ number:CGFloat) -> CGFloat{
        return number * .pi/180
    }
    
}






