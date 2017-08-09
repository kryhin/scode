//
//  SettingsViewController.swift
//  Tip it!
//
//  Created by Vlad on 8/5/17.
//  Copyright © 2017 Vlad. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DefaultTextField: UITextField!
    @IBOutlet weak var MinTextField: UITextField!
    @IBOutlet weak var MaxTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DefaultTextField.text = String(format: "%.0f", self.defaults.double(forKey: "DefaultTipPercent"))
        MinTextField.text = String(format: "%.0f", self.defaults.double(forKey: "MinTipPercent"))
        MaxTextField.text = String(format: "%.0f", self.defaults.double(forKey: "MaxTipPercent"))
    }
    
    @IBAction func update(_ sender: Any) {
        let defaultTip = Double(DefaultTextField.text!) ?? self.defaults.double(forKey: "DefaultTipPercent")
        let minTip = Double(MinTextField.text!) ?? self.defaults.double(forKey: "MinTipPercent")
        let maxTip = Double(MaxTextField.text!) ?? self.defaults.double(forKey: "MaxTipPercent")
        
        self.defaults.set(defaultTip, forKey:  "DefaultTipPercent")
        self.defaults.set(minTip, forKey: "MinTipPercent")
        self.defaults.set(maxTip, forKey: "MaxTipPercent")
    }
    
    @IBAction func validateInput(_ sender: UITextField) {
        // Here I try to handle user input and make sure that it looks at least sane in main.
        // logic implies that zero percent is possible value, not sure if some tippers want it, but still,
        // it is possible that percent for two or three segments can be the equal, but if the requirement -
        // to offset values set by user then we can easily add this offset for segments to look nicer...
        if sender.tag == 0 {
            if self.defaults.double(forKey: "DefaultTipPercent") < self.defaults.double(forKey: "MinTipPercent"){
                self.defaults.set(self.defaults.double(forKey: "DefaultTipPercent"), forKey: "MinTipPercent")
            }
            if self.defaults.double(forKey: "DefaultTipPercent") > self.defaults.double(forKey: "MaxTipPercent"){
                self.defaults.set(self.defaults.double(forKey: "DefaultTipPercent"), forKey: "MaxTipPercent")
            }
        }
        if sender.tag == 1 {
            if self.defaults.double(forKey: "MaxTipPercent") <= self.defaults.double(forKey: "MinTipPercent"){
                self.defaults.set(self.defaults.double(forKey: "DefaultTipPercent"), forKey: "MinTipPercent")
                self.defaults.set(self.defaults.double(forKey: "DefaultTipPercent"), forKey: "MaxTipPercent")
            }
            if (self.defaults.double(forKey: "DefaultTipPercent") < self.defaults.double(forKey: "MinTipPercent")) && (self.defaults.double(forKey: "MinTipPercent") <= self.defaults.double(forKey: "MaxTipPercent")){
                self.defaults.set(self.defaults.double(forKey: "MinTipPercent"), forKey: "DefaultTipPercent")
            }
        }
        if sender.tag == 2  {
            if self.defaults.double(forKey: "DefaultTipPercent") > self.defaults.double(forKey: "MaxTipPercent"){
                self.defaults.set(self.defaults.double(forKey: "MaxTipPercent"), forKey: "DefaultTipPercent")
            }
            if self.defaults.double(forKey: "MinTipPercent") >= self.defaults.double(forKey: "MaxTipPercent"){
                if self.defaults.double(forKey: "MaxTipPercent") == 0 {
                    self.defaults.set(0, forKey: "DefaultTipPercent")
                    self.defaults.set(0, forKey: "MinTipPercent")
                } else if self.defaults.double(forKey: "MaxTipPercent") == 1 {
                    self.defaults.set(1, forKey: "DefaultTipPercent")
                    self.defaults.set(0, forKey: "MinTipPercent")
                } else if self.defaults.double(forKey: "MaxTipPercent") > 1 {
                    self.defaults.set(self.defaults.double(forKey: "MaxTipPercent"), forKey: "DefaultTipPercent")
                    self.defaults.set(1, forKey: "MinTipPercent")
                }
            }
            if self.defaults.double(forKey: "DefaultTipPercent") <= self.defaults.double(forKey: "MinTipPercent"){
                self.defaults.set(self.defaults.double(forKey: "MinTipPercent"), forKey: "DefaultTipPercent")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
