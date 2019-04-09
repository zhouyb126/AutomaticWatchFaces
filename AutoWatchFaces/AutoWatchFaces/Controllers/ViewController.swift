//
//  ViewController.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 27/12/2018.
//  Copyright © 2018 Sylvain Guillier. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WCSessionDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    var watchList = WatchManager.watchList
    var session : WCSession!
    let defaults = UserDefaults.standard
    
//    let newWatchFaces = true
//    var udNewWatchFaces: Bool {
//        get{
//            if let value = UserDefaults.standard.value(forKey: "NewWatchFaces") as! Bool?{
//                return value
//            }
//            else{
//                return true
//            }
//
//        }
//        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 112
        tableview.allowsSelection = true
        
        if (WCSession.isSupported()) {
            session = WCSession.default
            session.delegate = self
            session.activate()
        }
        if let userWatchDatabase = UserDefaults.standard.value(forKey: "UserWatchList") as! Data?{
            let uwdDecoded = try? JSONDecoder().decode([Watch].self, from: userWatchDatabase)
            watchList = uwdDecoded!
            
            // Get Watch List ID
            var watchIdList = [Int]()
            for watch in watchList{
                watchIdList.append(watch.id!)
            }
            
            print (watchIdList)
            
            // Add new watchfaces
            for watch in WatchManager.getWatchDatabase(){
                if (watchIdList.index(of: watch.id!) == nil){
                    watchList.append(watch)
                }
            }
            if let watchListEncoded = try? JSONEncoder().encode(watchList){
                UserDefaults.standard.set(watchListEncoded, forKey: "UserWatchList")
            }
            
        }
        
        // TEST
//            if udNewWatchFaces || newWatchFaces{
//                print("Je suis dedans")
//                updateWatchDatabase()
//                UserDefaults.standard.set(false, forKey: "NewWatchFaces")
//            }
        
        // FIN TEST UPDATE Function en bas
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if Settings.getSettingsChange(){
            session.sendMessage(["Settings":[Settings.getBackgroundColors(),Settings.getForegroundColors(),Settings.getQuartzMode()]], replyHandler: nil, errorHandler: nil)
            Settings.setToFalseSettingsChange()
        }
        if CustomWatchManager.isReadyToSend() == true{
            let customWatch = CustomWatchManager.encodeCustomWatchface()
            session.sendMessage(["CustomWatchface":customWatch!], replyHandler: nil, errorHandler: nil)
            CustomWatchManager.resetReadyToSend()
        }
        
    }
    
    // MARK: Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return watchList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchCell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: String(watchList[indexPath.row].getId()!))
        
        cell.textLabel?.text = watchList[indexPath.row].getName()
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if watchList[indexPath.row].getAlternative().count > 0 {
            CustomWatchManager.setCustomWatch(watch: watchList[indexPath.row])
            performSegue(withIdentifier: "alternativeVC", sender: nil)
        }
        else{
            if let id = watchList[indexPath.row].id{
                session.sendMessage(["CurrentWatch": id], replyHandler: nil)
            }
        }
        
         tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = watchList[sourceIndexPath.row]
        watchList.remove(at: sourceIndexPath.row)
        watchList.insert(movedObject, at: destinationIndexPath.row)
    }
    
    // MARK: Session
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    
    func sendUserWatchList(){
        if let watchListEncoded = try? JSONEncoder().encode(watchList){
            UserDefaults.standard.set(watchListEncoded, forKey: "UserWatchList")
            session.sendMessage(["WatchList":watchListEncoded], replyHandler: nil
                , errorHandler: nil)
        }
    }
    
    
    
    // MARK: UIButton
    
    @IBAction func modifyButtonPressed(_ sender: UIButton) {
        if tableview.isEditing==false{
            tableview.isEditing = true
            
            sender.setTitle("Done",for: .normal)
        }
            
        else {
            tableview.isEditing = false
            sender.setTitle("Modify",for: .normal)
            sendUserWatchList()
        }
    }
    
    
    // TEST
//    func updateWatchDatabase(){
//        let watchDatabase = WatchManager.getWatchDatabase()
//        for watch in watchDatabase{
//            if (watchList.index(of: watch) == nil){
//                watchList.append(watch)
//            }
//        }
//        if let watchListEncoded = try? JSONEncoder().encode(watchList){
//            UserDefaults.standard.set(watchListEncoded, forKey: "UserWatchList")
//        }
//    }
//
    
    //FIN TEST
    
}


