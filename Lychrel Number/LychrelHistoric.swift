//
//  LychrelHistoric.swift
//  Lychrel Number
//
//  Created by Lionel Maquet on 18/08/2020.
//  Copyright © 2020 Lionel Maquet. All rights reserved.
//

import Foundation

class LychrelHistoric {
    var mightBeLychrel: Bool = true
    var historicOfOperations = [Int]()
    var numberOfOperations : Int {
        self.historicOfOperations.count - 1 // first number given is not an operation
    }
}
