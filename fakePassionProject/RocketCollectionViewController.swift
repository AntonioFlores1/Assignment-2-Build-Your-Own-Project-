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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return rocketInfo.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return rocketInfo[section].flickr_images.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? RocketCollectionViewCell else {return UICollectionViewCell()}
        
        let singleURL = rocketInfo[indexPath.section].flickr_images[indexPath.row]
        
            let ImageURL = URL.init(string: singleURL)
            do {
                let data = try Data.init(contentsOf: ImageURL!)
                cell.rocketImage.image = UIImage.init(data: data)
            } catch {
                print(error)
            }
        
        
        
        
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
   

}
