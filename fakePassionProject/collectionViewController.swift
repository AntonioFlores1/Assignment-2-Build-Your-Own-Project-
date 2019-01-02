//
//  collectionViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/28/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class collectionViewController: UIViewController {
    
    class NavigationController: UINavigationController {}

    @IBOutlet weak var rocketCollectionView: UICollectionView!
    
    var rocketInfo = [AllRockets](){
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
       // rocketCollectionView.delegate = self as! UICollectionViewDelegate
        self.rocketCollectionView.dataSource = self
        self.rocketCollectionView.delegate = self as! UICollectionViewDelegate
        
        // Set the cells sizes and layout direction
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 335, height: 410)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        self.rocketCollectionView.collectionViewLayout = layout
        
        self.rocketCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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
            let allRocketInfo = try JSONDecoder().decode([AllRockets].self, from: data)
            self.rocketInfo = allRocketInfo
            
        } catch {
            print("JSon failed because \(error)")
        }
    }
    
    
    
}
extension collectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}
//extension collectionViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = DetailViewController.instantiate()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}

//extension collectionViewController: UICollectionViewDataSource {
    
//    var rocketInfo = [AllSpaceXLaunches](){
//        didSet {
//            DispatchQueue.main.async {
//                self.rocketCollectionView.reloadData()
//            }
//        }
//    }
    
    

//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 72
//}

//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "newCell", for: indexPath) as? collectionInfo else {return UICollectionViewCell()}
//    let cellSelected = rocketInfo[indexPath.row]
//
//    cell.FlightNameAndNumber.text = "Flight: \(cellSelected.flight_number) Missions: \(cellSelected.mission_name)"
//
//    cell.collectiondetail.text = "Details: \(String(describing: cellSelected.details))"
//
//    guard let URLimage = URL.init(string: (cellSelected.links?.mission_patch_small)!) else {return UICollectionViewCell()}
//    do {
//        let data = try Data.init(contentsOf: URLimage)
//        cell.collectionImage.image = UIImage.init(data: data)
//    } catch {
//        print("Image Error:\(error)")
//    }
//
//    return cell
//}



//func preferredStatusBarStyle() -> UIStatusBarStyle {
//    return UIStatusBarStyle.lightContent
//}
 func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}


//extension RocketController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rocketInfo.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellSelected = rocketInfo[indexPath.row]
//
//        guard let cell = rocketTableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as? rocketCell else {return UITableViewCell()}
//
//        cell.rocketNumber.text = "Flight Number: \(cellSelected.flight_number) Year: \(cellSelected.launch_year)"
//        cell.flightName.text = "\(String(describing: cellSelected.rocket?.rocket_name))"
//        cell.launchFrom.text = "\(cellSelected.launch_site.site_name_long)"
//        cell.Details.text = cellSelected.details
//        guard let URLImage = URL.init(string: ((cellSelected.links?.mission_patch_small)!)) else { return UITableViewCell() }
//        do {
//            let data = try Data.init(contentsOf: URLImage)
//            cell.rocketImage.image = UIImage.init(data: data)
//        } catch {
//            print("Error Data \(error)")
//        }
//
//        //cell.rocketImage.image = UIImage.  cellSelected.links?.mission_patch_small
//        return cell
//    }
//}
//
//extension RocketController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
//}
//
