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
    let defaults = UserDefaults.standard
    
    
    // MARK: Init
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
        WatchManager.initWatchManager()
        setWatchFace()
        
    }
    
    override func willActivate() {
        if (WCSession.isSupported()) {
            session = WCSession.default
            session.delegate = self
            session.activate()
        }
        skInterface.isPaused = false
    }
    override func didAppear() {
        hideTime()
        crownSequencer.focus()
        
    }
    
    func setWatchFace(){
        if let scene = WatchScene(fileNamed: "WatchScene"){
            scene.scaleMode = .aspectFit
            if WatchManager.isQuartzModeActive() == true{
                skInterface.preferredFramesPerSecond = 1
            }
            else{
                skInterface.preferredFramesPerSecond = 25
            }
            skInterface.presentScene(scene)
        }
    }
    
    // MARK: Digital Crown rotation
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        crownAccumulator += rotationalDelta
        if WatchManager.isInGmtSettings(){
            if crownAccumulator > 0.01{
                let timeZone = WatchManager.getTimeZone()
                WatchManager.setTimeZone(value: timeZone+1)
                if timeZone == 360{
                    WatchManager.setTimeZone(value: 0)
                }
                crownAccumulator = 0
            }
            
        }
        else if WatchManager.isCrownLocked() == false{
            if (crownAccumulator > 0.5 && WatchManager.getActualWatchIndex() < WatchManager.watchList.count-1){
                WatchManager.nextWatchface()
                setWatchFace()
                crownAccumulator = 0.0
            }
            else if (crownAccumulator < -0.5 && WatchManager.getActualWatchIndex() > 0){
                WatchManager.previousWatchface()
                setWatchFace()
                crownAccumulator = 0.0
            }
            else if (crownAccumulator > 0.5 || crownAccumulator < -0.5){
                WKInterfaceDevice.current().play(.click)
            }
        }
    }
    
    func crownDidBecomeIdle(_ crownSequencer: WKCrownSequencer?) {
        crownAccumulator = 0.0
    }
    
    // Mark: Gestures
    @IBAction func tapGesture(_ sender: Any) {
        if (WatchManager.getActualWatch().getChronograph() != nil) {
            
            
            if WatchManager.ChronographIsWorking() == false{
                WatchManager.startChronograph()
                
            }
            else {
                WatchManager.stopChronograph()
                
            }
            WKInterfaceDevice.current().play(.click)
        }
    }
    
    
    
    @IBAction func longPressGesture(_ sender: Any) {
        
        if (WatchManager.getActualWatch().getChronograph() != nil) {
            WatchManager.resetChronograph()
            WKInterfaceDevice.current().play(.click)
        }
    }
    
    
    @IBAction func swipeRightGesture(_ sender: Any) {
        WatchManager.previousAlternativeWatchface()
        setWatchFace()
    }
    
    @IBAction func swipeLeftGesture(_ sender: Any) {
        WatchManager.nextAlternativeWatchface()
        setWatchFace()
    }
    
    //MARK: Session
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let messageFromPhone = message["CurrentWatch"] as? Int{
            let watch = WatchManager.getWatchfaceWithId(Id: messageFromPhone)
            WatchManager.setActualWatchface(watch: watch)
            
        }
        else if let messageFromPhone = message["Settings"] as? [Any]{
            WatchManager.setBackgroundColor(value: messageFromPhone[0] as! [Float])
            WatchManager.setForegroundColor(value: messageFromPhone[1] as! [Float])
            WatchManager.setQuartzMode(value: messageFromPhone[2] as! Bool)
            print(messageFromPhone)
        }
            
        else if let messageFromPhone = message["CustomWatchface"] as? Data{
            WatchManager.prepareCustomWatchface(watchData: messageFromPhone)
        }
            
        else if let messageFromPhone = message["WatchList"] as?Data{
            let WatchListFromDecoder = try? JSONDecoder().decode([Watch].self, from: messageFromPhone)
            WatchManager.prepareWatchList(watchListFromPhone: WatchListFromDecoder!)
        }
        
        setWatchFace()
        
    }
    
    // MARK: UIButtons
    @IBAction func setFavoriteWatchFace() {
        WatchManager.setFavoriteWatchface()
    }
    
    @IBAction func crownRotationLock() {
        WatchManager.changeRotationLockState()
    }
    
    
    @IBAction func gmtSettings() {
        if WatchManager.getActualWatch().getGmt() != nil{
            WatchManager.changeGmtSettingsState()
            if !WatchManager.isInGmtSettings(){
                defaults.set(WatchManager.getTimeZone(), forKey: "FavoriteTimezone")
            }
        }
    }
    
    @IBAction func nightMode() {
        WatchManager.changeNightModeState()
        setWatchFace()
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


