//
//  Operand.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal class Operand {
    var numerator: Int
    var denominator: Int
    
    convenience init(value:Int) {
        try! self.init(numerator: value, denominator: 1)
    }
    
    init(numerator:Int, denominator:Int) throws {
        guard denominator != 0 else {
            throw OperandError.DenominatorZero
        }
        
        let sign = numerator/denominator;
        
        self.numerator = abs(numerator)
        self.denominator = abs(denominator)
        
        if sign < 0 {
            self.numerator *= -1;
        }
    }
    
}

enum OperandError:ErrorType {
    case DenominatorZero
}