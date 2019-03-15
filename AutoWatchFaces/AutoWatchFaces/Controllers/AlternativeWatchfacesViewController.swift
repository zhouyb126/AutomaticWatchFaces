//
//  AlternativeWatchfacesViewController.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 20/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import UIKit

class AlternativeWatchfacesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var dialsCollectionView: UICollectionView!
    @IBOutlet weak var handsCollectionView: UICollectionView!
    
    var selectedDial : String = CustomWatchManager.getCustomWatch().getDialName()!
    var selectedHand : Int = 0
    
    // MARK: Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dialsCollectionView{
            return CustomWatchManager.getAvailableDialListCount()
            
        }
        else{
            return CustomWatchManager.getAvailableHandListCount()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dialsCollectionView{
            let cell = dialsCollectionView.dequeueReusableCell(withReuseIdentifier: "dialWatchfaceCell", for: indexPath) as! AlternativeCollectionViewCell
            
            cell.setDialCell(for: CustomWatchManager.getDialName(forIndex: indexPath.row),with: selectedDial)
            
            return cell
            
        }
        else{
            let cell = handsCollectionView.dequeueReusableCell(withReuseIdentifier: "handWatchfaceCell", for: indexPath) as! AlternativeCollectionViewCell
            
            cell.setHandCell(at: indexPath, with: selectedHand,from: CustomWatchManager.getCustomWatch().getId()!)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dialsCollectionView{
            selectedDial = CustomWatchManager.getDialName(forIndex: indexPath.row)
            //        print(selectedDial)
            dialsCollectionView.reloadData()
        }
            
        else{
            selectedHand = indexPath.row
            
            handsCollectionView.reloadData()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dialsCollectionView.delegate = self
        dialsCollectionView.dataSource = self
        dialsCollectionView.allowsMultipleSelection = false
        
        handsCollectionView.delegate = self
        handsCollectionView.dataSource = self
        handsCollectionView.allowsMultipleSelection = false
        CustomWatchManager.resetCustomParameters()
        CustomWatchManager.setAvailableDialList()
        CustomWatchManager.setAvailableHandList()
    }
    
    
    // MARK: Button
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if selectedDial.isEmpty == false{
            CustomWatchManager.prepareWatchface(selectedDial: selectedDial,selectedHandSet: selectedHand)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}



