//
//  LychrelProcessManager.swift
//  Lychrel Number
//
//  Created by Lionel Maquet on 18/08/2020.
//  Copyright © 2020 Lionel Maquet. All rights reserved.
//

import Foundation

class LychrelManager {
    var mightBeLychrel: Bool = true
    var historicOfOperations = [Int]()
    
    var numberOfOperations : Int {
        self.historicOfOperations.count - 1 // first number given is not an operation
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
    
    func lychrelProcess(number: Int) -> Bool { // returns is yes if lychrelNumber
        
        self.historicOfOperations.append(number)
        let newNumber = revertAndAdd(number: number)
        if (newNumber != -1){
            if (!isPalindrome(number: newNumber)){
                self.lychrelProcess(number: newNumber)
            } else {
                self.historicOfOperations.append(newNumber)
                self.mightBeLychrel = false
                return self.mightBeLychrel
            }
        } else {
            return self.mightBeLychrel
        }
        return self.mightBeLychrel
    }
    
    func doNewLychrelProcess(number: Int){
        self.mightBeLychrel = true
        self.historicOfOperations = []
        lychrelProcess(number: number)
        printInfos()
    }
    
    func printInfos(){
        print("Might your number \(self.historicOfOperations[0]) be a lychrel number ? Answer is \(self.mightBeLychrel) \n")
        print("Number of operations tried : \(self.numberOfOperations) \n")
        print("Historic of operations : \(self.historicOfOperations)")
    }
    
}
