//
//  AlternativeDialCollectionViewCell.swift
//  AutoWatchFaces
//
//  Created by Sylvain Guillier on 20/02/2019.
//  Copyright © 2019 Sylvain Guillier. All rights reserved.
//

import UIKit

class AlternativeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    
    
    func setDialCell(for dial: String,with selectedDial:String){
        let imageName = "\(dial)"
        image.image = UIImage(named: "\(imageName)")
        image.contentMode = .scaleAspectFit
        if selectedDial == imageName{
            //            image.sizeToFit()
            image.layer.borderWidth = 3
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.cornerRadius = 10
        }
        else{
            image.layer.borderWidth = 0
            image.layer.cornerRadius = 0
        }
    }
    
    func setHandCell(at indexPath:IndexPath,with selectedHand : Int,from selectedWatchfaceId: Int){
        let imageName = "\(selectedWatchfaceId)-\(indexPath.row)"
        print(imageName)
        image.image = UIImage(named: "\(imageName)")
        image.contentMode = .scaleAspectFit
        if selectedHand == indexPath.row{
            image.layer.borderWidth = 3
            image.layer.borderColor = UIColor.white.cgColor
            image.layer.cornerRadius = 10
        }
        else{
            image.layer.borderWidth = 0
            image.layer.cornerRadius = 0
        }    }
    
    
}
