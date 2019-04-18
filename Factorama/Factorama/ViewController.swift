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
    
    // var factorGame = FactorGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PickerOutlet.delegate = self
        PickerOutlet.dataSource = self
        
        PickerOutlet.selectRow(0, inComponent: 0, animated: false)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 3
        }else{
            switch factorGame.currentSetting {
            case 0:
                return factorGame.Easy.count
            case 1:
                return factorGame.Medium.count
            case 2:
                return factorGame.Hard.count
            default:
                return factorGame.Easy.count
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return factorGame.dificulty[row]
        }else{
            switch factorGame.currentSetting {
            case 0:
                return String(factorGame.Easy[row])
            case 1:
                return String(factorGame.Medium[row])
            case 2:
                return String(factorGame.Hard[row])
            default:
                return String(factorGame.Easy[row])
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            factorGame.currentSetting = row
            pickerView.reloadComponent(1)
        case 1:
            let selectedRow = pickerView.selectedRow(inComponent: 1)
            switch factorGame.currentSetting{
            case 0:
                factorGame.currentNumber = factorGame.Easy[selectedRow]
            case 1:
                factorGame.currentNumber = factorGame.Medium[selectedRow]
            case 2:
                factorGame.currentNumber = factorGame.Hard[selectedRow]
            default:
                factorGame.currentNumber = factorGame.Easy[selectedRow]
            }
        default:
            print("Whoops")
        }
        NumberToFactorLabelOutlet.text = "Number to Factor:\n\(factorGame.currentNumber)"
    }
    
    
    @IBAction func StartButtonDidPress(_ sender: UIButton) {
        switch factorGame.currentSetting{
        case 0:
            manager.currentPuzzle = manager.easyPuzzles.first(where: {$0.numToSplit == factorGame.currentNumber})!
            break
        case 1:
            manager.currentPuzzle = manager.mediumPuzzles.first(where: {$0.numToSplit == factorGame.currentNumber})!
            break
        default:
            manager.currentPuzzle = manager.hardPuzzles.first(where: {$0.numToSplit == factorGame.currentNumber})!
            break
        }
    }
    
    
    
    
    
}

