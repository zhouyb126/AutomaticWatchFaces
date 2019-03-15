//
//  CustomWatchManager.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 02/03/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
class CustomWatchManager{
    private static var customWatch = Watch(name: "Custom")
    private static var availableHandsList = [[Hand?]]()
    private static var availableDialList = [String]()
    private static var readyToSend = false
    
    private static let watchList = WatchDatabase().getWatchDatabase()
    
    // MARK: Getter
    static func getCustomWatch()->Watch{
        return customWatch
    }
    
    static func getAvailableHandList() -> [[Hand?]]{
        setAvailableHandList()
        return availableHandsList
    }
    
    static func getAvailableHandListCount() -> Int{
        return availableHandsList.count
    }
    
    static func getAvailableDialList()-> [String] {
        return availableDialList
    }
    
    static func getAvailableDialListCount()-> Int {
        return availableDialList.count
    }
    
    static func getDialName(forIndex index:Int)->String{
        return availableDialList[index]
    }
    
    // Mark: Setter
    
    static func setCustomWatch(watch:Watch){
        customWatch = watch.copy() as! Watch
    }
    
    static func setAvailableHandList(){
        let originalHands = [customWatch.getSecondHand(),customWatch.getMinuteHand(),customWatch.getHourHand(),customWatch.getChronograph()?.getSecondHand(),customWatch.getChronograph()?.getMinuteHand(),customWatch.getChronograph()?.getHourHand()]
        availableHandsList.append(originalHands)
        verifyIfHandsAlreadyExist()
    }
    
    static func setAvailableDialList(){
        availableDialList.append(customWatch.getDialName()!)
        print(customWatch.getDialName()!)
        for alt in customWatch.getAlternative(){
            print(customWatch.getAlternative().count)
            if alt?.getDialName() != nil{
            availableDialList.append(alt!.getDialName()!)
            }
        }
    }
    
    static func setReadyToSend(){
        readyToSend = true
    }
    
    // MARK: Methods
    private static func verifyIfHandsAlreadyExist(){
        for altHands in customWatch.getAlternative(){
            var testAltHands = [altHands!.getSecondHand(),altHands!.getMinuteHand(),altHands!.getHourHand()]
            let testChronoHands = [altHands?.getChronograph()?.getSecondHand(),altHands?.getChronograph()?.getMinuteHand(),altHands?.getChronograph()?.getHourHand()]
            var chronoHandsAlreadyOnList = true
            var handsAlreadyOnTheList = false
            if customWatch.getChronograph() != nil{
                for hands in availableHandsList{
                    if testChronoHands[0]?.getImageName() != hands[3]?.getImageName() || testChronoHands[1]?.getImageName() != hands[4]?.getImageName() || testChronoHands[2]?.getImageName() != hands[5]?.getImageName(){
                        chronoHandsAlreadyOnList = false
                        break
                    }
                }
            }
            for hands in availableHandsList{

                if testAltHands[0]?.getImageName() == hands[0]?.getImageName() && testAltHands[1]?.getImageName() == hands[1]?.getImageName() && testAltHands[2]?.getImageName() == hands[2]?.getImageName(){
                    handsAlreadyOnTheList = true
                    break
                    
                }
                
            }
            if handsAlreadyOnTheList == false || chronoHandsAlreadyOnList == false{
                let handsToAdd = [testAltHands[0],testAltHands[1],testAltHands[2],testChronoHands[0],testChronoHands[1],testChronoHands[2]]
                availableHandsList.append(handsToAdd)
                print(availableHandsList.count)
            }
        }
    }
    
    static func resetCustomParameters(){
        availableDialList = []
        availableHandsList = []
    }
    
    static func isReadyToSend()->Bool{
        return readyToSend
    }
    
    
    
    static func resetReadyToSend(){
        readyToSend = false
    }
    
    static func prepareWatchface(selectedDial:String,selectedHandSet:Int){
        let watchInt = availableDialList.firstIndex(of: selectedDial)
        if watchInt != 0{
            let watchId = customWatch.getId()
            customWatch = customWatch.getAlternative()[watchInt!-1]!
            customWatch.setId(value: watchId!)
        }
        let selectedHand = availableHandsList[selectedHandSet]
        if selectedHand[0] != nil{
            customWatch.setSecondHand(value: selectedHand[0]!)
        }
        if selectedHand[1] != nil{
            customWatch.setMinuteHand(value: selectedHand[1]!)
        }
        if selectedHand[2] != nil{
            customWatch.setHourHand(value: selectedHand[2]!)
        }
        if selectedHand[3] != nil{
            customWatch.getChronograph()?.setSecondHand(value: selectedHand[3]!)
        }
        if selectedHand[4] != nil{
            customWatch.getChronograph()?.setMinuteHand(value: selectedHand[4]!)
        }
        if selectedHand[5] != nil{
            customWatch.getChronograph()?.setHourHand(value: selectedHand[5]!)
        }
        customWatch.clearAlternativeList()
        readyToSend = true
    }
    
    
    
    // MARK : Encode
    static func encodeCustomWatchface()-> Data?{
        var encodedWatch = Data()
        encodedWatch = try! JSONEncoder().encode(customWatch)
        resetReadyToSend()
        return encodedWatch
    }
    
}
