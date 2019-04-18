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
        if Int(factorL.text!) != nil && Int(factorR.text!) != nil{
            _ = manager.submitFactor(lhs: Int(factorL.text!)!, rhs: Int(factorR.text!)!)
            factorView.reloadData()
            updateLabels()
            factorL.text! = ""
            factorR.text! = ""
        }
        
        
    }
    func updateLabels(){
        totalR.text = manager.currentPuzzle.totalR.description
        totalL.text = manager.currentPuzzle.totalL.description
        scoreLabel.text = "Score: \(manager.totalScore.description)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberLabel.text = manager.currentPuzzle.numToSplit.description
        self.factorView.allowsSelection = true
        self.factorView.register(UITableViewCell.self, forCellReuseIdentifier: "Prototype")
        self.factorView.delegate = self
        self.factorView.dataSource = self
        OffsetL.text! = manager.currentPuzzle.leftOfset.description
        OffsetR.text! = manager.currentPuzzle.rightOfset.description
        
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
