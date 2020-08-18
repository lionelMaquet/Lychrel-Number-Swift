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
        
        let numberToTry = 1998
        let lych = lychrelProcess(number: numberToTry, lychrelHistoric: nil)
        print("Might your number \(numberToTry) be a lychrel number ? Answer is \(lych.mightBeLychrel) \n")
        print("Number of operations tried : \(lych.numberOfOperations) \n")
        print("Historic of operations : \(lych.historicOfOperations)")
        
    }
    
    func revertAndAdd(number: Int) -> Int {
        
        if (revert(number: number) != -1){
            return number + revert(number: number)
        } else {
            return -1 // stop signal
        }
        
    }
    
    func revert(number: Int) -> Int {
        var numberArray = [Character]()
        for i in String(number) {
            numberArray.insert(i, at:0)
        }
        var finalNumberString = ""
        
        if numberArray.count > 16 {
            return -1 // stop signal. too big of a number, we can't revert and add again.
        }
        
        for i in numberArray {
            finalNumberString = "\(finalNumberString)\(i)"
        }
        
        let revertedNumber = Int(finalNumberString)
        
        return revertedNumber!
        
    }
    
    func isPalindrome(number: Int) -> Bool {
        return number == revert(number: number)
    }
    
    func lychrelProcess(number: Int, lychrelHistoric : LychrelHistoric?) -> LychrelHistoric {
        
        let lychrelHist : LychrelHistoric
        
        if let sureLychrelHistoric = lychrelHistoric {
            lychrelHist = sureLychrelHistoric
        } else {
            lychrelHist = LychrelHistoric()
        }
        lychrelHist.historicOfOperations.append(number)
        
        let newNumber = revertAndAdd(number: number)
        
        if (newNumber != -1){
            
            if (!isPalindrome(number: newNumber)){
                //lychrelHist.historicOfOperations.append(newNumber)
                lychrelProcess(number: newNumber, lychrelHistoric: lychrelHist)
            } else {
                lychrelHist.historicOfOperations.append(newNumber)
                lychrelHist.mightBeLychrel = false
                return lychrelHist
            }
        } else {
            return lychrelHist
        }
    
        return lychrelHist
    }

}

