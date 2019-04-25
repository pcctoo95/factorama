//
//  SplashViewController.swift
//  Factorama
//
//  Created by Student on 4/24/19.
//  Copyright © 2019 com.joshuakneilson. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var splashTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.5, animations: {
            self.splashTitle.alpha = 1
            
            self.view.alpha = 0
        }) { (success) in
            self.performSegue(withIdentifier: "gametime", sender: nil)
            
        }
        
    }
    
    
    
}
