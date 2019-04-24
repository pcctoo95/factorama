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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.5, animations: {
            self.logo.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
            self.view.backgroundColor = UIColor.white
        }) { (success) in
            self.performSegue(withIdentifier: "gametime", sender: nil)
            
        }
        
    }
    
    
    
}
