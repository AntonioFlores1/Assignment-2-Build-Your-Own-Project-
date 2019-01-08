//
//  RocketCollectionViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 1/2/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class RocketCollectionViewController: UICollectionViewController {
    
    @IBOutlet var rocketCollectionView: UICollectionView!
    
    
    var rocketInfo = [AllSpaceXLaunches](){
        didSet {
            DispatchQueue.main.async {
                self.rocketCollectionView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (data) in
            self.parson(data: data)
        }
        dump(rocketInfo)
        
    }
    
    
    func loadData(completionHandler: @escaping ((Data) -> Void )) {
        guard let rocketUrl = URL.init(string: "https://api.spacexdata.com/v3/rockets") else {return}
        
        URLSession.shared.dataTask(with: rocketUrl) { (data,response, error) in
            if let data = data {
                completionHandler(data)
            }
            if let response = response {
                print("Rsponse : \(response)")
            }
            if let error = error {
                print("URL failed because: \(error)")
            }
            }.resume()
    }
    
    func parson(data:Data) {
        do {
            let allRocketInfo = try JSONDecoder().decode([AllSpaceXLaunches].self, from: data)
            self.rocketInfo = allRocketInfo
            
        } catch {
            print("JSon failed because \(error)")
        }
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return rocketInfo.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocketInfo.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? RocketCollectionViewCell else {return UICollectionViewCell()}
        
        let singleURL = rocketInfo[indexPath.section].links?.flickr_images![indexPath.row]
        
        if !(singleURL?.isEmpty)! {
            DispatchQueue.global().async {
                let ImageURL = URL.init(string: singleURL!)
                do {
                    let data = try Data.init(contentsOf: ImageURL!)
                    cell.rocketImage.image = UIImage.init(data: data)
                } catch {
                    print(error)
                }
            }
            
        } else {
            cell.rocketImage.image = UIImage.init(named: "image1")
        }
        
        
        
        
        
        
    
        return cell
    }

   

}
