//
//  ViewController.swift
//  Tip it!
//
//  Created by Vlad on 8/5/17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControll: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.becomeFirstResponder()
        let defaultTip = 18
        let minTip = 15
        let maxTip = 20
        
        defaults.set(defaultTip, forKey: "DefaultTipPercent")
        defaults.set(minTip, forKey: "MinTipPercent")
        defaults.set(maxTip, forKey: "MaxTipPercent")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        calculateTip((Any).self)
        
        let displayMinPC = String(format: "%.0f%%", self.defaults.double(forKey: "MinTipPercent"))
        let displayDefaultPC = String(format: "%.0f%%", self.defaults.double(forKey: "DefaultTipPercent"))
        let displayMaxPC = String(format: "%.0f%%", self.defaults.double(forKey: "MaxTipPercent"))
        
        tipControll.setTitle(displayMinPC, forSegmentAt: 0)
        tipControll.setTitle(displayDefaultPC, forSegmentAt: 1)
        tipControll.setTitle(displayMaxPC, forSegmentAt: 2)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapAnywhere(_ sender: Any) {
        view.endEditing(false)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPC = [self.defaults.double(forKey: "MinTipPercent") / 100,
                     self.defaults.double(forKey: "DefaultTipPercent") / 100,
                     self.defaults.double(forKey: "MaxTipPercent") / 100]
        
        let billAmount = Double(billField.text!) ?? 0
        let justTip = billAmount * tipPC[tipControll.selectedSegmentIndex]
        let total = billAmount + justTip
        
        tipLabel.text = String(format: "$%.2f", justTip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}
