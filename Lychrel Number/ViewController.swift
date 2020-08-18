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
        // Do any additional setup after loading the view.
        print(revertAndAdd(number: 9435239 ))
        print(isPalindrome(number: 1001))
    }
    
    func revertAndAdd(number: Int) -> Int {
        return number + revert(number: number)
    }
    
    func revert(number: Int) -> Int {
        var numberArray = [Character]()
        for i in String(number) {
            numberArray.insert(i, at:0)
        }
        var finalNumberString = ""
        
        for i in numberArray {
            finalNumberString = "\(finalNumberString)\(i)"
        }
        
        let revertedNumber = Int(finalNumberString)
        
        return revertedNumber!
        
    }
    
    func isPalindrome(number: Int) -> Bool {
        return number == revert(number: number)
    }

}

