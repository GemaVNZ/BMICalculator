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
        labelWeight.text = String(format: "%.2f KG", weight)
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
        let formattedResult = String(format: "%.2f", result)
        var description: String
        var color: UIColor
        
        let intenseYellow = UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
        
        switch result {
        case 0.0..<18.5:
            description = "Underweight"
            color = UIColor.blue
        case 18.5..<25:
            description = "Normal weight"
            color = UIColor.green
        case 25..<30:
            description = "Overweight"
            color = intenseYellow
        default:
            description = "Obesity"
            color = UIColor.red
        }
        
        let attributedText = NSMutableAttributedString(string: "\(formattedResult)\n", attributes: [.font: UIFont.systemFont(ofSize: 32)])
        
        let descriptionText = NSAttributedString(string: description, attributes: [.foregroundColor: color, .font: UIFont.systemFont(ofSize: 24)])
        attributedText.append(descriptionText)
        
        imcTextView.attributedText = attributedText
        
        imcTextView.textAlignment = .center
        
        //imcTextView.attributedText = attributedText
        
        //imcTextView.text = "\(formattedResult) - \(description)"
    }
}

