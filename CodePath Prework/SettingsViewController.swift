//
//  SettingsViewController.swift
//  CodePath Prework
//
//  Created by klaire ✨ on 2/8/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipDefault: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipPercentage = defaults.integer(forKey: "tipPercentage")
               tipPercentageSlider.value = Float(tipPercentage)
               tipPercentageLabel.text = "\(tipPercentage)%"

    }
    @IBAction func defaultTipChanged(_ sender: UISlider) {
        let tipPercentage = Int(sender.value)
        tipPercentageLabel.text = "\(tipPercentage)%"
        defaults.set(tipPercentage, forKey: "tipPercentage")
    }

    


}
