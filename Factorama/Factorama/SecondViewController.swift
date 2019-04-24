//
//  SecondViewController.swift
//  Factorama
//
//  Created by student on 4/18/19.
//  Copyright © 2019 com.joshuakneilson. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var factorL: UITextField!
    @IBOutlet var factorR: UITextField!
    @IBOutlet var factorView: UITableView!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var totalR: UILabel!
    @IBOutlet var totalL: UILabel!
    
    @IBOutlet var OffsetR: UILabel!
    @IBOutlet var OffsetL: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.currentPuzzle.foundFactors.count
    }
    @IBAction func submitFactors(){
        var success = false
        if Int(factorL.text!) != nil && Int(factorR.text!) != nil{
            success = manager.submitFactor(lhs: Int(factorL.text!)!, rhs: Int(factorR.text!)!)
            factorView.reloadData()
            updateLabels()
            factorL.text! = ""
            factorR.text! = ""
        }
        if !success{
            factorR.shake()
            factorL.shake()
        }
        
        
    }
    func updateLabels(){
        totalR.text = manager.currentPuzzle.totalR.description
        totalL.text = manager.currentPuzzle.totalL.description
        scoreLabel.text = "Score: \(manager.currentPuzzle.currentScore.description) / \(manager.currentPuzzle.possibleScore.description)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberLabel.text = "Number to Factor: \(manager.currentPuzzle.numToSplit.description)"
        self.factorView.allowsSelection = true
        self.factorView.register(UITableViewCell.self, forCellReuseIdentifier: "Prototype")
        self.factorView.delegate = self
        self.factorView.dataSource = self
        OffsetL.text! = "+ \(manager.currentPuzzle.leftOfset.description)"
        OffsetR.text! = "+ \(manager.currentPuzzle.rightOfset.description)"
        
        updateLabels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = self.factorView.dequeueReusableCell(withIdentifier: "Prototype")!
        cell.textLabel!.textAlignment = .center
        let f = manager.currentPuzzle.foundFactors[indexPath.row]
        cell.textLabel?.text = "\(f.left) X \(f.right)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath){
        print("You tapped cell number \(indexPath.row)")
        let values = tableView.cellForRow(at: indexPath)!.textLabel
        let f = Factor(factor: values!.text!)
        let index = manager.currentPuzzle.foundFactors.firstIndex(of: f)
        manager.currentPuzzle.foundFactors[index!].swap()
        let newf = manager.currentPuzzle.foundFactors[index!]
        tableView.cellForRow(at: indexPath)!.textLabel!.text = "\(newf.left) X \(newf.right)"
        updateLabels()
    }
    
    
}

public extension UIView {
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: self.center.y))
        layer.add(animation, forKey: "shake")
    }
}
