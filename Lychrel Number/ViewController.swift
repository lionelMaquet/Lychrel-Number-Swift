//
//  ViewController.swift
//  Lychrel Number
//
//  Created by Lionel Maquet on 18/08/2020.
//  Copyright © 2020 Lionel Maquet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lychrel : LychrelManager?
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        lychrel = LychrelManager()
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        lychrel?.doNewLychrelProcess(number: Int(slider.value))
        
        let responseText = "\(lychrel!.historicOfOperations[0]) might be a Lychrel Number : \(lychrel!.mightBeLychrel) \n\n\n Number found after \(lychrel!.historicOfOperations.count - 1) calculation(s) is : \(lychrel!.historicOfOperations.last!)"
        responseLabel.text = responseText
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = "\(Int(slider.value))"
    }
    
    
}

