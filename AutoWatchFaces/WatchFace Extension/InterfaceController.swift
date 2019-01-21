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
    
    var crownAccumulator = 0.0
    
    var alternativeWatchNb = 0
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        skInterface.isPaused = false
        WatchManager.actualWatch = WatchManager.watchList[WatchManager.actualWatchNB]
        setWatchFace()
        
    }
    
    override func didAppear() {
        hideTime()
        crownSequencer.focus()
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        crownAccumulator += rotationalDelta
        if (crownAccumulator > 0.5 && WatchManager.actualWatchNB < WatchManager.watchList.count-1){
            WatchManager.actualWatchNB += 1
            alternativeWatchNb = 0
            WatchManager.actualWatch = WatchDatabase.init().watchDatabase[WatchManager.actualWatchNB]
            crownAccumulator = 0.0
            setWatchFace()
        }
        else if (crownAccumulator < -0.5 && WatchManager.actualWatchNB > 0){
            WatchManager.actualWatchNB -= 1
            alternativeWatchNb = 0
            WatchManager.actualWatch = WatchDatabase.init().watchDatabase[WatchManager.actualWatchNB]
            crownAccumulator = 0.0
            setWatchFace()
        }
        else if (crownAccumulator > 0.5 || crownAccumulator < -0.5){
            WKInterfaceDevice.current().play(.click)
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
        if (WatchManager.actualWatch.chronograph != nil) {
            
            if WatchManager.actualWatch.chronograph!.inWork == false{
                
                WatchManager.actualWatch.chronograph!.startChronograph()
                
            }
            else {
                WatchManager.actualWatch.chronograph!.stopChronograph()
                
            }
            
            WKInterfaceDevice.current().play(.click)
        }
    }
    
    
    
    @IBAction func longPressGesture(_ sender: Any) {
        
        WatchManager.actualWatch.chronograph!.resetChronograph()
        WKInterfaceDevice.current().play(.click)
    }
    
    
    @IBAction func swipeRightGesture(_ sender: Any) {
        if alternativeWatchNb > 0{
            if alternativeWatchNb == 1{
                WatchManager.actualWatch = WatchDatabase.init().watchDatabase[WatchManager.actualWatchNB]
                alternativeWatchNb = 0
            }
            else if (WatchManager.actualWatch.alternative.count > 0){
                alternativeWatchNb -= 1
                WatchManager.configureAlternativeWatch(alternativeWatchNb: alternativeWatchNb)
                
            }
            setWatchFace()
        }
    }
    
    @IBAction func swipeLeftGesture(_ sender: Any) {
        if (WatchManager.actualWatch.alternative.count > 0 && alternativeWatchNb < WatchManager.actualWatch.alternative.count){
            alternativeWatchNb += 1
            WatchManager.configureAlternativeWatch(alternativeWatchNb: alternativeWatchNb)
            
            setWatchFace()
        }
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
