//
//  ViewController.swift
//  Lychrel Number
//
//  Created by Lionel Maquet on 18/08/2020.
//  Copyright © 2020 Lionel Maquet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lychrel = LychrelManager()
        lychrel.doNewLychrelProcess(number: 19876)
        lychrel.doNewLychrelProcess(number: 14)
        lychrel.doNewLychrelProcess(number: 1678)
        lychrel.doNewLychrelProcess(number: 00)
        
        
        
    }
    
    
    
}

