//
//  MyCollectionDetailViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 1/8/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class MyCollectionDetailViewController: UIViewController {
    
    var DetailLaunches: AllSpaceXLaunches!
    
    @IBOutlet weak var DetailImage: UIImageView!
    
    @IBOutlet weak var DetailScroll: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailScroll.text =
        """
        Flight Number: \(DetailLaunches.flight_number)    Mission: \(DetailLaunches.mission_name)
        
        Date: \(DetailLaunches.launch_date_local) Year: \(DetailLaunches.launch_year)
        
        Launched From - \(DetailLaunches.launch_site.site_name_long)
        
        
        Detials about the mission - \(DetailLaunches.details ?? "Info. Not Available")
        
        """
        let URLString = DetailLaunches.links?.flickr_images
        
        if (URLString?.isEmpty)! {
            
            DetailImage.image = UIImage.init(named: "image1")
            
        } else {
            
            for singleURL in URLString! {
                
                let MyUrl = URL.init(string: singleURL)
                DispatchQueue.global().async {
                    do {
                        let data = try Data.init(contentsOf: MyUrl!)
                        DispatchQueue.main.async {
                        self.DetailImage.image = UIImage.init(data: data)
                        }
                    } catch {
                        print(error)
                    }
                    
                }
                
            }
        }
    }
    
    
    @IBAction func Dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
