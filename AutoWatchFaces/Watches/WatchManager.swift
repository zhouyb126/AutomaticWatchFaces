//
//  WatchManager.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 12/01/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit
class WatchManager{
    static var watchList = WatchDatabase().getWatchDatabase()
    private static var watchIdList:[Int] = []
    
    
    private static var actualWatchIndex = 0
    private static var actualAlternativeWatchIndex = 0
    private static var actualWatchHandsNb = 0
    private static var actualWatch = Watch(id: 0, name: "", dial: "")
    private static var inSettings = false
    private static var crownLocked = false
    private static var timeZone = 0
    private static var nightMode = false
    private static var backgroundColor : [Float] = [0.5,0.5,0.5]
    private static var foregroundColor : [Float] = [0.5,0.5,0.5]
    private static var quartzMode = false
    
    private static var chronographIsWorking = false
    
    private static var secondsChronographStarted: CGFloat = 0
    private static var secondsChronographSaved : CGFloat = 0
    
    private static var minutesChronographStarted: CGFloat = 0
    private static var minutesChronographSaved : CGFloat = 0
    
    private static var hoursChronographStarted: CGFloat = 0
    private static var hoursChronographSaved : CGFloat = 0
    
    
    
    let newWatchFaces = true
    var udNewWatchFaces: Bool {
        get{
            if let value = UserDefaults.standard.value(forKey: "NewWatchFaces") as! Bool?{
                return value
            }
            else{
                return true
            }
            
        }
    }
    
    
    static func startChronograph(){
        let date = Date()
        let calendar = Calendar.current
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        
        chronographIsWorking = true
        
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
        
        chronographIsWorking = false
        
        secondsChronographSaved += (seconds + nanoseconds/pow(10,9)) - secondsChronographStarted
        
        
        minutesChronographSaved += minutes+(seconds/60) - minutesChronographStarted
        
        hoursChronographSaved += (hour*30 + minutes/2) - hoursChronographStarted
        
    }
    
    static func resetChronograph(){
        chronographIsWorking = false
        secondsChronographStarted = 0
        secondsChronographSaved = 0
        minutesChronographStarted = 0
        minutesChronographSaved = 0
        hoursChronographStarted = 0
        hoursChronographSaved = 0
        
    }
    
    static func nextWatchface(){
        actualWatchIndex += 1
        actualAlternativeWatchIndex = 0
        actualWatch = getWatchface(at: actualWatchIndex)
    }
    
    static func previousWatchface(){
        actualWatchIndex -= 1
        actualAlternativeWatchIndex = 0
        actualWatch = getWatchface(at: actualWatchIndex)
    }
    
    private static func initWatchface(){
        if let watchData = UserDefaults.standard.value(forKey: "FavoriteWatchface") as! Data?{
            let WatchSetFromDecoder = try? JSONDecoder().decode(Watch.self, from: watchData)
            //            currentWatch = WatchSetFromDecoder
            //        if let favoriteWatch =  UserDefaults.standard.value(forKey: "FavoriteWatchface")as! Watch?{
            actualWatch = WatchSetFromDecoder!
        }
        else{
            actualWatch = getWatchface(at: 0)
        }
    }
    
    private static func initTimezone(){
        if let favoriteTimezone = UserDefaults.standard.value(forKey: "FavoriteTimezone") as! Int?{
            timeZone = favoriteTimezone
            print(favoriteTimezone)
        }
    }
    
    static func initWatchManager(){
        initWatchDatabase()
        initWatchIdList()
        checkNewWatchOnDatabase()
        initTimezone()
        initWatchface()
        initQuartzMode()
        initBackgroundColor()
        initForegroundColor()
    }
    
    static func initWatchDatabase(){
        if let userWatchDatabase = UserDefaults.standard.value(forKey: "UserWatchList") as! Data?{
            let uwdDecoded = try? JSONDecoder().decode([Watch].self, from: userWatchDatabase)
            watchList = uwdDecoded!
            }
            
        
        else{
            watchList = WatchDatabase().getWatchDatabase()
        }
    }
    
    static func getWatchface(at indice:Int) -> Watch{
        let id = watchIdList[indice]
        return getWatchfaceWithId(Id: id)
        
    }
    
    static func getActualWatch() -> Watch{
        return actualWatch
    }
    
    static func getBackgroundColor()->[Float]{
        return backgroundColor
    }
    
    
    static func getForegroundColor()->[Float]{
        return foregroundColor
    }
    
    static func isQuartzModeActive() -> Bool{
        return quartzMode
    }
    
    static func isInGmtSettings() -> Bool{
        return inSettings
    }
    
    static func isCrownLocked() -> Bool{
        return crownLocked
    }
    
    static func getActualWatchId() -> Int{
        return actualWatch.id!
    }
    
    
    static func nextAlternativeWatchface(){
        //Need the orginal to see the alternative list
        if let watch = getWatchface(at: actualWatchIndex) as Watch?{
            if (watch.getAlternative().count > 0 && actualAlternativeWatchIndex < watch.getAlternative().count){
                actualAlternativeWatchIndex += 1
                actualWatch = watch.getAlternative()[actualAlternativeWatchIndex-1]!
            }
        }
    }
    
    static func previousAlternativeWatchface(){
        if actualAlternativeWatchIndex > 0{
            if actualAlternativeWatchIndex == 1{
                actualWatch = getWatchface(at: actualWatchIndex)
                actualAlternativeWatchIndex = 0
            }
            else {
                actualAlternativeWatchIndex -= 1
                if actualWatch.getAlternative().count > 0{
                    actualWatch = actualWatch.getAlternative()[actualAlternativeWatchIndex-1]!
                }
                else if (WatchManager.getWatchface(at: actualWatchIndex).getAlternative().count > 0){
                    actualWatch = WatchManager.getWatchface(at: actualWatchIndex).getAlternative()[actualAlternativeWatchIndex-1]!
                    
                }
            }
        }
        
        
    }
    
    private static func setActualWatchNumber(value : Int){
        actualWatchHandsNb = value
    }
    
    
    static func setBackgroundColor(value:[Float]){
        backgroundColor = value
        UserDefaults.standard.set(value, forKey: "BackColor")
    }
    
    static func setForegroundColor(value:[Float]){
        foregroundColor = value
        UserDefaults.standard.set(value, forKey: "ForeColor")
    }
    
    static func changeRotationLockState(){
        crownLocked = !crownLocked
    }
    
    static func changeGmtSettingsState(){
        inSettings = !inSettings
    }
    
    static func changeNightModeState(){
        nightMode = !nightMode
    }
    
    static func isNightModeEnable() -> Bool{
        return nightMode
    }
    
    
    static func setTimeZone(value:Int){
        timeZone = value
    }
    
    static func getTimeZone() -> Int{
        return timeZone
    }
    
    static func ChronographIsWorking()->Bool{
        return chronographIsWorking
    }
    static func changeChronographWorkingState(){
        chronographIsWorking = !chronographIsWorking
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
    
    static func setFavoriteWatchface(){
        if let encoded = try? JSONEncoder().encode(actualWatch) {
            UserDefaults.standard.set(encoded, forKey: "FavoriteWatchface")
            print("FavoriteWatchfaceSave")
        }
    }
    
    static func setActualWatchface(watch:Watch){
        actualWatch = watch
    }
    
    static func getWatchfaceWithId(Id:Int)->Watch{
        return (watchList.first(where:{$0.id == Id}))!
    }
    
    static func prepareCustomWatchface(watchData:Data){
        let WatchSetFromDecoder = try? JSONDecoder().decode(Watch.self, from: watchData)
        
        let originalWatchface = getWatchfaceWithId(Id: (WatchSetFromDecoder?.getId())!)
        originalWatchface.appendAlternativeWatchface(watch: WatchSetFromDecoder!)
        actualWatchIndex = watchIdList.index(of: WatchSetFromDecoder!.id!)!
        print(actualWatchIndex)
        actualAlternativeWatchIndex = originalWatchface.getAlternative().count-1
        actualWatch = watchList[actualWatchIndex].getAlternative()[actualAlternativeWatchIndex]!
    }
    
    
    private static func initBackgroundColor(){
        if let result = UserDefaults.standard.value(forKey: "BackColor") as! [Float]?{
            backgroundColor = [result[0]/255,result[1]/255,result[2]/255]
            print(backgroundColor)
        }
    }
    
    private static func initForegroundColor(){
        if let result = UserDefaults.standard.value(forKey: "ForeColor") as! [Float]?{
            foregroundColor = [result[0]/255,result[1]/255,result[2]/255]
            print(foregroundColor)
        }
    }
    
    
    
    static func setQuartzMode(value:Bool){
        quartzMode = value
        UserDefaults.standard.set(value, forKey: "quartzMode")
    }
    
    private static func initQuartzMode(){
        if let result = UserDefaults.standard.value(forKey: "quartzMode") as! Bool?{
            quartzMode = result
        }
    }
    
    private static func initWatchIdList(){
        watchIdList = []
        for watch in watchList{
            watchIdList.append(watch.id!)
        }
        print(watchIdList)
    }
    
    static func getIdFromWatchIndex(index:Int)->Int{
        return watchList[index].id!
    }
    
    static func getActualWatchIndex()->Int{
        return actualWatchIndex
    }
    
    static func prepareWatchList(watchListFromPhone:[Watch]){
        watchList = watchListFromPhone
        saveUserWatchList()
        initWatchIdList()
        actualWatchIndex = 0
        actualAlternativeWatchIndex = 0
        actualWatch = getWatchface(at: 0)
    }
    
    private static func saveUserWatchList(){
        let watchlistEncoded = try? JSONEncoder().encode(watchList)
        UserDefaults.standard.set(watchlistEncoded, forKey: "UserWatchList")
    }
    
    
    static func getWatchDatabase() -> [Watch]{
        return watchList
    }
    
    
    
    
    // TEST
//    static func updateWatchDatabase(){
//        for watch in WatchManager.getWatchDatabase(){
//            print (watch.id)
//            if (watchIdList.index(of: watch.id!) == nil){
//                watchList.append(watch)
//            }
//        }
//        if let watchListEncoded = try? JSONEncoder().encode(WatchManager.watchList){
//            UserDefaults.standard.set(watchListEncoded, forKey: "UserWatchList")
//        }
//    }


static func checkNewWatchOnDatabase(){
    for watch in WatchDatabase().getWatchDatabase(){
        if (watchIdList.index(of: watch.id!) == nil){
            watchList.append(watch)
            watchIdList.append(watch.id!)
        }
        
        if let watchListEncoded = try? JSONEncoder().encode(WatchManager.watchList){
            UserDefaults.standard.set(watchListEncoded, forKey: "UserWatchList")
        }
}
    
    //FIN TEST

    
    
}
}
