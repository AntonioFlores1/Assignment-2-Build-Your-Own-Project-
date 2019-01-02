//
//  ViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class RocketController: UIViewController {

    var rocketInfo = [AllSpaceXLaunches](){
        didSet {
            DispatchQueue.main.async {
                self.rocketTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var rocketTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (data) in
            self.parson(data: data)
        }
        dump(rocketInfo)
        rocketTableView.dataSource = self
        rocketTableView.delegate = self
        
    }


    
    
    func loadData(completionHandler: @escaping ((Data) -> Void )) {
        guard let rocketUrl = URL.init(string: "https://api.spacexdata.com/v3/launches") else {return}
        
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
    
    
    
}

extension RocketController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return rocketInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSelected = rocketInfo[indexPath.row]
        
        guard let cell = rocketTableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as? rocketCell else {return UITableViewCell()}
    
        cell.rocketNumber.text = "Flight Number: \(cellSelected.flight_number) Year: \(cellSelected.launch_year)"
        cell.flightName.text = "\(String(describing: cellSelected.rocket?.rocket_name))"
        cell.launchFrom.text = "\(cellSelected.launch_site.site_name_long)"
        cell.Details.text = cellSelected.details
        guard let URLImage = URL.init(string: ((cellSelected.links?.mission_patch_small)!)) else { return UITableViewCell() }
        do {
            let data = try Data.init(contentsOf: URLImage)
            cell.rocketImage.image = UIImage.init(data: data)
        } catch {
            print("Error Data \(error)")
        }
        
        //cell.rocketImage.image = UIImage.  cellSelected.links?.mission_patch_small
        return cell
    }
}

extension RocketController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
