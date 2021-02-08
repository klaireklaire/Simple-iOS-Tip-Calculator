//
//  ViewController.swift
//  CodePath Prework
//
//  Created by klaire ✨ on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
        self.navigationController?.setNavigationBarHidden(false, animated: true)
           let tipPercentage = defaults.integer(forKey: "tipPercentage")
           tipPercentageSlider.value = Float(tipPercentage)
           tipPercentageLabel.text = "\(tipPercentage)%"
        
        UIView.animate(withDuration: 0.4, delay: 0.0,
                                options: [.autoreverse,.repeat], animations: { () -> Void in
                   self.totalLabel.transform = CGAffineTransform(translationX: 0, y: 3)
                }, completion: nil)
           
       }
    
    @IBAction func unwindWithSegue (_segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billField.text!) ?? 0.00
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentage = round(tipPercentageSlider.value)
        let tip = bill * Double(tipPercentage) / 100
        let total = bill + tip
        
        // Update
        tipPercentageLabel.text = "\(Int(tipPercentage))%"
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
}


