//
//  SettingsViewController.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 18/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var quartzModeSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var foregroundColorView: UIView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    var backgroundColor:[Float] = [0.0,0.0,0.0]
    var foregroundColor:[Float] = [1.0,1.0,1.0]
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getSettings()
        initColorViews()
        updateSliderValue()
        updateColorLabels()
        updateQuartzMode()
    }
    
    override func viewWillLayoutSubviews() {
        foregroundColorView.layer.cornerRadius = 10
        backgroundColorView.layer.cornerRadius = 10
    }
    
    
    // Retrieve saved colors
    func getSettings(){
        backgroundColor = Settings.getBackgroundColors()
        foregroundColor =  Settings.getForegroundColors()
    }
    
    func initColorViews(){
        changeViewColor(for: backgroundColorView, rValue: backgroundColor[0], gValue: backgroundColor[1], bValue: backgroundColor[2])
        changeViewColor(for: foregroundColorView, rValue: foregroundColor[0], gValue: foregroundColor[1], bValue: foregroundColor[2])
    }
    
    // Change the views colors
    func changeViewColor(for view:UIView,rValue:Float,gValue:Float,bValue:Float){
        view.backgroundColor = UIColor(red: CGFloat(rValue), green: CGFloat(gValue), blue: (CGFloat(bValue)),alpha:CGFloat(1))
    }
    
    // MARK: Button
    @IBAction func segmentedControllerTouched(_ sender: UISegmentedControl) {
        updateSliderValue()
        updateColorLabels()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        Settings.setQuartzMode(value: quartzModeSwitch.isOn)
        Settings.setBackColors(rBack: backgroundColor[0], gBack: backgroundColor[1], bBack: backgroundColor[2])
        Settings.setForeColors(rFore: foregroundColor[0], gFore: foregroundColor[1], bFore: foregroundColor[2])
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func slidersValueChanged(_ sender: Any) {
        if segmentedController.selectedSegmentIndex == 0{
            backgroundColor = [redSlider.value/255,greenSlider.value/255,blueSlider.value/255]
            changeViewColor(for:backgroundColorView,rValue: backgroundColor[0], gValue: backgroundColor[1], bValue: backgroundColor[2])
        }
        else{
            foregroundColor = [redSlider.value/255,greenSlider.value/255,blueSlider.value/255]
            changeViewColor(for:foregroundColorView,rValue: foregroundColor[0], gValue: foregroundColor[1], bValue: foregroundColor[2])
        }
        updateColorLabels()
    }
    
    
    
    // MARK: Update
    
    func updateColorLabels(){
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
        
    }
    
    func updateQuartzMode(){
        quartzModeSwitch.setOn(Settings.getQuartzMode(), animated: true)
    }
    
    func updateSliderValue(){
        if segmentedController.selectedSegmentIndex == 0{
            redSlider.value = backgroundColor[0]*255
            greenSlider.value = backgroundColor[1]*255
            blueSlider.value = backgroundColor[2]*255
            
        }
        else{
            redSlider.value = foregroundColor[0]*255
            greenSlider.value = foregroundColor[1]*255
            blueSlider.value = foregroundColor[2]*255
        }
    }
    
    
}
