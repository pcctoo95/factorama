//
//  ViewController.swift
//  factorGame
//
//  Created by student on 3/28/19.
//  Copyright © 2019 com.joshuakneilson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var PickerOutlet: UIPickerView!
    @IBOutlet var NumberToFactorLabelOutlet: UILabel!
    @IBOutlet var StartButtonOutet: UIButton!
    
    @IBOutlet var totalScoreLabel: UILabel!
    // var factorGame = FactorGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PickerOutlet.delegate = self
        PickerOutlet.dataSource = self
        
        PickerOutlet.selectRow(0, inComponent: 0, animated: false)
        totalScoreLabel.text! = "Score:  \(manager.totalScore.description)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 3
        }else{
            switch manager.currentSetting {
            case 0:
                return manager.easyPuzzles.count
            case 1:
                return manager.mediumPuzzles.count
            case 2:
                return manager.hardPuzzles.count
            default:
                return manager.easyPuzzles.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return manager.dificulty[row]
        }else{
            switch manager.currentSetting {
            case 0:
                return String(manager.easyPuzzles[row].numToSplit)
            case 1:
                return String(manager.mediumPuzzles[row].numToSplit)
            case 2:
                return String(manager.hardPuzzles[row].numToSplit)
            default:
                return String(manager.easyPuzzles[row].numToSplit)
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            manager.currentSetting = row
            pickerView.reloadComponent(1)
        case 1:
            if let selectedRow = Int(pickerView.selectedRow(inComponent: 1).description){
                switch manager.currentSetting{
                case 0:
                    manager.setPuzzle(difficulty: "Easy", num: selectedRow)
                case 1:
                    manager.setPuzzle(difficulty: "Medium", num: selectedRow)
                case 2:
                    manager.setPuzzle(difficulty: "Hard", num: selectedRow)
                default:
                    manager.setPuzzle(difficulty: "Easy", num: selectedRow)
                }
            }
        default:
            print("Whoops")
        }
        NumberToFactorLabelOutlet.text = "Number to Factor:\n\(manager.currentPuzzle.numToSplit)"
    }
    
    
    @IBAction func StartButtonDidPress(_ sender: UIButton) {

    }
    
    
    
    
    
}

