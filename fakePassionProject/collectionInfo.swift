//
//  collectionInfo.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/28/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class collectionInfo: UICollectionViewCell {
    
    
//    var myInfo: AllSpaceXLaunches! {
//        didSet {
//            DispatchQueue.main.async {
//               self.reloadMyInfo()
//            }
//        }
//    }
    
    @IBOutlet weak var FlightNameAndNumber: UILabel!
    
    @IBOutlet weak var collectiondetail: UILabel!
    
    @IBOutlet weak var collectionImage: UIImageView!
    
    
//    func reloadMyInfo(){
//        FlightNameAndNumber?.text = "Flight:\(myInfo.flight_number) Mission:\(myInfo.mission_name)"
//        collectiondetail?.text = "Details: \(myInfo.details)"
//        collectionImage.image = UIImage.init(named:(myInfo.links?.mission_patch_small)!)
//    }
    
    
    
}
