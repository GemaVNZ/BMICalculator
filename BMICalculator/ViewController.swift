//
//  ViewController.swift
//  BMICalculator
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelWeight: UILabel!
    
    @IBOutlet weak var labelHeight: UILabel!
    
    @IBOutlet weak var imcTextView: UITextView!
    
    var weight: Float = 80
    var height: Int = 160
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onWeightChangedSlider(_ sender: UISlider) {
        weight = (sender.value)
        labelWeight.text = "\(weight) KG"
        updateIMCDescription()
    }
    
    @IBAction func onHeightChangedStepper(_ sender: UIStepper) {
        height =  Int (sender.value)
        labelHeight.text = "\(height) cm"
        updateIMCDescription()
    }
    
    
    @IBAction func IMCCalculateButton() {
        updateIMCDescription()
        }
    
    func updateIMCDescription() {
        let result = weight / ((Float(height) / 100) * (Float(height) / 100))
        var description: String
        
        switch result {
        case 0.0..<18.5:
            description = "Underweight"
        case 18.5..<25:
            description = "Normal weight"
        case 25..<30:
            description = "Overweight"
        default:
            description = "Obesity"
        }
        
        imcTextView.text = "\(result) - \(description)"
    }
}

