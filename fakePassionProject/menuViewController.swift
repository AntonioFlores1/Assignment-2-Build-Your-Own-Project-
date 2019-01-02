//
//  menuViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 1/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var allChoices: [UIButton]!
    
    @IBAction func SelectedMenu(_ sender: Any) {
        
        allChoices.forEach { (buttons) in
            UIView.animate(withDuration: 0.3, animations:  {
                buttons.isHidden = !buttons.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func buttonsChoices(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
