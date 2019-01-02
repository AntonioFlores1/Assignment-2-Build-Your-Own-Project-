//
//  ViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/26/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class MyCollectionViewController: UICollectionViewController {

    @IBOutlet var rocketCollection: UICollectionView!

    
    var rocks = [AllSpaceXLaunches](){
            didSet {
                DispatchQueue.main.async {
                    self.rocketCollection.reloadData()
                }
            }
        }
    
    func loadData(completionHandler: @escaping ((Data) -> Void )) {
        guard let rocketUrl = URL.init(string: "https://api.spacexdata.com/v3/launches/past") else {return}
        
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
            self.rocks = allRocketInfo
            
        } catch {
            print("JSon failed because \(error)")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let patternImage = UIImage(named: "rocket2") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clear
        
        loadData { (data) in
            self.parson(data: data)
        }
        dump(rocks)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocks.count
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rocketCollection.dequeueReusableCell(withReuseIdentifier: "Celly", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        let cellInfo = rocks[indexPath.row]
        cell.rocklabel.text = """
Flight Number: \(cellInfo.flight_number)   Mission: \(cellInfo.mission_name)
Details: \(cellInfo.details ?? "INFO Not Available")
"""
        
    let URLImage = URL.init(string: ((cellInfo.links?.mission_patch_small)!))
        do {
            let mydata = try Data.init(contentsOf: URLImage!)
            cell.rockimage.image = UIImage.init(data: mydata)
        } catch {
            print(error)
        }
        return cell
    }
    
    
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}



//var rocks = [AllSpaceXLaunches](){
//        didSet {
//            DispatchQueue.main.async {
//                self.rocketCollectionView.reloadData()
//            }
//        }
//    }


//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "newCell", for: indexPath) as UICollectionViewCell //as? collectionInfo else {return UICollectionViewCell()}
//    let cellSelected = rocketInfo[indexPath.row]

    //    cell.FlightNameAndNumber.text = "Flight: \(cellSelected.flight_number) Missions: \(cellSelected.mission_name)"
    //
    //    cell.collectiondetail.text = "Details: \(cellSelected.details)"
    //
    //    guard let URLimage = URL.init(string: (cellSelected.links?.mission_patch_small)!) else {return UICollectionViewCell()}
    //    do {
    //        let data = try Data.init(contentsOf: URLimage)
    //        cell.collectionImage.image = UIImage.init(data: data)
    //    } catch {
    //        print("Image Error:\(error)")
    //    }
    
//    return cell
//}



//func preferredStatusBarStyle() -> UIStatusBarStyle {
//    return UIStatusBarStyle.lightContent
//}
//func numberOfSections(in collectionView: UICollectionView) -> Int {
//    return 1
//}
