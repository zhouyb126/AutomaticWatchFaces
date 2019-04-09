//
//  Chronograph.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 17/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

class Chronograph: NSObject,Codable{
    private var secHand: Hand?
    private var minuteHand: Hand?
    private var hourHand : Hand?
    private let minuteDialNb : Int?
    private let secondOnTop: Bool?
    
    private static var secondsChronographStarted: CGFloat = 0
    private static var secondsChronographSaved : CGFloat = 0
    
    private static var minutesChronographStarted: CGFloat = 0
    private static var minutesChronographSaved : CGFloat = 0
    
    private static var hoursChronographStarted: CGFloat = 0
    private static var hoursChronographSaved : CGFloat = 0
    
    
    private static var inWork:Bool = false
    
    init(secHand:Hand?=nil,minuteHand:Hand?=nil,hourHand:Hand?=nil,minuteDialNb : Int?=30,secondOnTop:Bool?=false) {
        self.secHand = secHand
        self.minuteHand = minuteHand
        self.hourHand = hourHand
        self.secondOnTop = secondOnTop
        self.minuteDialNb = minuteDialNb
    }
    
    func getSecondHand()->Hand?{
        return secHand
    }
    
    func getMinuteHand() -> Hand?{
        return minuteHand
    }
    
    func getHourHand()->Hand?{
        return hourHand
    }
    
    static func startChronograph(){
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
    
    static func stopChronograph(){
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
    
    static func resetChronograph(){
        inWork = false
        secondsChronographStarted = 0
        secondsChronographSaved = 0
        minutesChronographStarted = 0
        minutesChronographSaved = 0
        hoursChronographStarted = 0
        hoursChronographSaved = 0
        
    }
    
    static func isWorking() -> Bool{
        return inWork
    }
    
    static func getSecondsChronographStarted() -> CGFloat{
        return secondsChronographStarted
    }
    
    static func getSecondsChronographSaved() -> CGFloat{
        return secondsChronographSaved
    }
    
    
    static func getMinutesChronographStarted() -> CGFloat{
        return minutesChronographStarted
    }
    
    static func getMinutesChronographSaved() -> CGFloat{
        return minutesChronographSaved
    }
    
    static func getHoursChronographStarted() -> CGFloat{
        return hoursChronographStarted
    }
    
    static func getHoursChronographSaved() -> CGFloat{
        return hoursChronographSaved
    }
    
    func getMinuteDialNumber()->Int?{
        return minuteDialNb
    }
    
    func getSecondOnTop()->Bool?{
        return secondOnTop
    }
    
    func setSecondHand(value:Hand){
        secHand = value
    }
    
    func setMinuteHand(value:Hand){
        minuteHand = value
    }
    
    func setHourHand(value:Hand){
        hourHand = value
    }
}
