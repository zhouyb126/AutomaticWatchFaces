//
//  Settings.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 19/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import Foundation

class Settings{
    static private var defaults = UserDefaults.standard
    private static var quartzMode = false
    private static var backColor = [0.0,0.0,0.0]
    private static var foreColor = [0.0,0.0,0.0]
    private static var settingsChange = false
    
    
    // Mark: Getter
    static func getQuartzMode()->Bool{
        if let result = defaults.value(forKey: "quartzMode") as! Bool?{
            return result
        }
        else{ return false}
    }
    
    static func getBackgroundColors() -> [Float]{
        if let result = defaults.value(forKey: "BackColor") as! [Float]?{
            return result
        }
        else {return [0.0,0.0,0.0]}
    }
    
    static func getForegroundColors() -> [Float]{
        if let result = defaults.value(forKey: "ForeColor") as! [Float]?{
            return result
        }
        else {return [0.0,0.0,0.0]}
    }
    
    static func getSettingsChange()->Bool{
        return settingsChange
    }
    
    // Mark: Setter
    static func setQuartzMode(value:Bool){
        defaults.set(value, forKey: "quartzMode")
        settingsChange = true
    }
    
    static func setBackColors(rBack:Float,gBack:Float,bBack:Float){
        defaults.set([rBack,gBack,bBack], forKey: "BackColor")
        settingsChange = true
    }
    
    static func setForeColors(rFore:Float,gFore:Float,bFore:Float){
        defaults.set([rFore,gFore,bFore], forKey: "ForeColor")
        settingsChange = true
    }
    
    
    
    static func setToFalseSettingsChange(){
        settingsChange = false
    }
    
    
}
