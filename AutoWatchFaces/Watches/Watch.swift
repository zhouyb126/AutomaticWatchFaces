//
//  Watch.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 12/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

class Watch: NSObject,Codable,NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Watch(id: id, name: name, dial: dial, topLayer: topLayer, secHand: secHand, minHand: minHand, hourHand: hourHand, date: date, chronograph: chronograph, grandeComplication: grandeComplication, dayCycle: dayCycle, day: day, battery: battery, skeleton: skeleton, tourbillon: tourbillon, secondOnTop: secondOnTop, stop2Go: stop2Go, gmt: gmt, luminescent: luminescent, biColour: biColour,customizable:customizable, alternative: alternative)
        return copy
    }
    
    var id: Int?
    var name : String
    private var dial : String?
    private var topLayer : TopLayer?
    private var date : WatchDate?
    private var minHand : Hand?
    private var secHand : Hand?
    private var hourHand : Hand?
    private let chronograph : Chronograph?
    private let grandeComplication : GrandeComplication?
    private let dayCycle :DayCycle?
    private let day: Day?
    private var alternative :[Watch?]
    private let battery : Battery?
    private let skeleton : Skeleton?
    private let tourbillon : Tourbillon?
    private let secondOnTop : Bool?
    private let stop2Go: Bool?
    private let gmt : Gmt?
    private let luminescent: Bool?
    private var biColour : DuoTone?
    private var customizable : Bool?
    
    init(id:Int?=nil,name:String,dial:String?=nil,topLayer:TopLayer?=nil,secHand:Hand?=nil,minHand:Hand?=nil,hourHand:Hand?=nil,date:WatchDate?=nil,chronograph:Chronograph?=nil,grandeComplication:GrandeComplication?=nil,dayCycle:DayCycle? = nil,day:Day?=nil,battery:Battery?=nil,skeleton:Skeleton?=nil,tourbillon:Tourbillon?=nil,secondOnTop:Bool? = true,stop2Go:Bool? = false,gmt:Gmt? = nil,luminescent:Bool? = false,biColour: DuoTone?=nil,customizable:Bool?=false,alternative:[Watch?]=[]) {
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
        self.topLayer = topLayer
        self.customizable = customizable
    }
    
    
    func getId() -> Int?{
        return id
    }
    
    func getName() -> String?{
        return name
    }
    
    func getDialName() -> String?{
        return dial
    }
    
    func getTopLayer () -> TopLayer?{
        return topLayer
    }
    
    func getSecondHand() -> Hand?{
        return secHand
    }
    
    func getMinuteHand() -> Hand?{
        return minHand
    }
    
    func getHourHand() -> Hand?{
        return hourHand
    }
    
    func getChronograph() -> Chronograph?{
        return chronograph
    }
    
    func getGrandeComplication() -> GrandeComplication?{
        return grandeComplication
    }
    
    func getDayCycle() -> DayCycle?{
        return dayCycle
    }
    
    func getDay() -> Day?{
        return day
    }
    
    func getAlternative() -> [Watch?]{
        return alternative
    }
    
    func getBattery() -> Battery?{
        return battery
    }
    
    func getSkeleton() -> Skeleton?{
        return skeleton
    }
    
    func getTourbillon() -> Tourbillon?{
        return tourbillon
    }
    
    func getSecondOnTop() -> Bool?{
        return secondOnTop
    }
    
    func getStop2Go() -> Bool?{
        return stop2Go
    }
    
    func getGmt() -> Gmt?{
        return gmt
    }
    
    func getLuminescent () -> Bool?{
        return luminescent
    }
    
    func getBiColour() -> DuoTone?{
        return biColour
    }
    
    func getDate() -> WatchDate?{
        return date
    }
    
    func setDial(value:String){
        dial = value
    }
    
    func setSecondHand(value:Hand){
        secHand = value
    }
    
    func setMinuteHand(value:Hand){
        minHand = value
    }
    
    func setHourHand(value:Hand){
        hourHand = value
    }
    
    func appendAlternativeWatchface(watch:Watch){
        alternative.append(watch)
    }
    
    func setName(value:String){
        name = value
    }
    
    func setId(value:Int){
        id = value
    }
    func clearAlternativeList(){
        alternative = []
    }
    
    func isCustomizable()->Bool?{
        return customizable
    }
}







