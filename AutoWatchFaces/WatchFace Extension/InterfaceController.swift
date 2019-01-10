//
//  InterfaceController.swift
//  WatchFace Extension
//
//  Created by Sylvain Guillier on 27/12/2018.
//  Copyright © 2018 Sylvain Guillier. All rights reserved.
//
import WatchKit
import SpriteKit
import Foundation


class InterfaceController: WKInterfaceController,WKCrownDelegate {
    
    @IBOutlet weak var skInterface: WKInterfaceSKScene!
    
    let watchList = WatchSettingsManager.watchSettingsList
    var crownAccumulator = 0.0
    
    
    
    //let currentDeviceSize = WKInterfaceDevice.current().screenBounds.size
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        skInterface.isPaused = false
        if let scene = WatchScene(fileNamed: "WatchScene"){
            skInterface.presentScene(scene)
        }
        
    }
    
    override func didAppear() {
        hideTime()
        crownSequencer.focus()
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        crownAccumulator += rotationalDelta
        if (crownAccumulator > 0.5 && WatchSettingsManager.actualWatch < watchList.count-1){
            WatchSettingsManager.actualWatch += 1
            crownAccumulator = 0.0
            setWatchFace()
        }
        else if (crownAccumulator < -0.5 && WatchSettingsManager.actualWatch > 0){
            WatchSettingsManager.actualWatch -= 1
            crownAccumulator = 0.0
            setWatchFace()
        }
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        crownAccumulator = 0.0
    }
    
    func setWatchFace(){
        if let scene = WatchScene(fileNamed: "WatchScene"){
            scene.scaleMode = .aspectFit
            skInterface.presentScene(scene)
        }
    }
    
    
    @IBAction func tapGesture(_ sender: Any) {
        let scene = WatchScene(fileNamed: "WatchScene")
        let date = Date()
        let calendar = Calendar.current        
        let hour = CGFloat(calendar.component(.hour, from: date))
        let minutes = CGFloat(calendar.component(.minute, from: date))
        
        let seconds = CGFloat(calendar.component(.second, from: date))
        let nanoseconds = CGFloat(calendar.component(.nanosecond, from: date))
        
        if WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronograph == true {
            
            if WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronographWorking! == false{
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronographWorking = true
                
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographStarted = seconds + nanoseconds/pow(10,9)
                
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographStarted = minutes+(seconds/60)
                
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographStarted = (hour*30 + minutes/2)
                
            }
            else {
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronographWorking = false
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographSaved += (seconds + nanoseconds/pow(10,9)) - WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographStarted
                
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographSaved += minutes+(seconds/60) - WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographStarted
                
                WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographSaved += (hour*30 + minutes/2) - WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographStarted
                
            }
            
            skInterface.presentScene(scene)
        }
    }
    
    
    
    @IBAction func longPressGesture(_ sender: Any) {
        
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].chronographWorking = false
        
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographStarted = 0
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].secondsChronographSaved = 0
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographStarted = 0
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].minutesChronographSaved = 0
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographStarted = 0
        WatchSettingsManager.watchSettingsList[WatchSettingsManager.actualWatch].hoursChronographSaved = 0
    }
}

// Hack in order to disable the digital time on the screen
extension WKInterfaceController{
    func hideTime(){
        guard let cls = NSClassFromString("SPFullScreenView") else {return}
        let viewControllers = (((NSClassFromString("UIApplication")?.value(forKey:"sharedApplication") as? NSObject)?.value(forKey: "keyWindow") as? NSObject)?.value(forKey:"rootViewController") as? NSObject)?.value(forKey:"viewControllers") as? [NSObject]
        viewControllers?.forEach{
            let views = ($0.value(forKey:"view") as? NSObject)?.value(forKey:"subviews") as? [NSObject]
            views?.forEach{
                if $0.isKind(of:cls){
                    (($0.value(forKey:"timeLabel") as? NSObject)?.value(forKey:"layer") as? NSObject)?.perform(NSSelectorFromString("setOpacity:"),with:CGFloat(0))
                }
            }
        }
        
    }
    
    
}
