//
//  InterfaceController.swift
//  WatchFace Extension
//
//  Created by Sylvain Guillier on 27/12/2018.
//  Copyright © 2018 Sylvain Guillier. All rights reserved.
//
import WatchKit
import SpriteKit
import WatchConnectivity


class InterfaceController: WKInterfaceController,WKCrownDelegate,WCSessionDelegate {
    
    @IBOutlet weak var skInterface: WKInterfaceSKScene!
    
    var crownAccumulator = 0.0
    var session : WCSession!
    
    var currentWatch :Watch!{
        didSet{
            WatchManager.actualWatch = currentWatch
            setWatchFace()
        }
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        skInterface.isPaused = false
        
    }
    
    override func willActivate() {
        if (WCSession.isSupported()) {
            session = WCSession.default
            session.delegate = self
            session.activate()
    }
    }
    override func didAppear() {
        hideTime()
        crownSequencer.focus()
        currentWatch = WatchManager.watchList[WatchManager.actualWatchNB]
    }
    
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        crownAccumulator += rotationalDelta
        if (crownAccumulator > 0.5 && WatchManager.actualWatchNB < WatchManager.watchList.count-1){
            WatchManager.actualWatchNB += 1
            WatchManager.alternativeWatchNb = 0
            currentWatch = WatchManager.watchList[WatchManager.actualWatchNB]
            crownAccumulator = 0.0
        }
        else if (crownAccumulator < -0.5 && WatchManager.actualWatchNB > 0){
            WatchManager.actualWatchNB -= 1
           WatchManager.alternativeWatchNb = 0
            currentWatch = WatchManager.watchList[WatchManager.actualWatchNB]
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
        if WatchManager.alternativeWatchNb > 0{
            if WatchManager.alternativeWatchNb == 1{
                WatchManager.actualWatch = WatchManager.watchList[WatchManager.actualWatchNB]
                WatchManager.alternativeWatchNb = 0
            }
            else if (WatchManager.actualWatch.alternative.count > 0){
                WatchManager.alternativeWatchNb -= 1
                WatchManager.configureAlternativeWatch()
                
            }
            setWatchFace()
        }
    }
    
    @IBAction func swipeLeftGesture(_ sender: Any) {
        if (WatchManager.actualWatch.alternative.count > 0 && WatchManager.alternativeWatchNb < WatchManager.actualWatch.alternative.count){
            WatchManager.alternativeWatchNb += 1
            WatchManager.configureAlternativeWatch()
            
            setWatchFace()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        WatchManager.alternativeWatchNb = 0
        WatchManager.actualWatchNB = message["CurrentWatch"] as! Int
        currentWatch = WatchManager.watchList[WatchManager.actualWatchNB]
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
