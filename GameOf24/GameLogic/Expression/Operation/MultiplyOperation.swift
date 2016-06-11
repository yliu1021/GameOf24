//
//  MultiplyOperation.swift
//  GameOf24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal class MultiplyOperator: Operation {
    var precedence: Int = 10
    
    func apply(op1: Operand, with op2: Operand) -> Operand {
        let n = op1.numerator * op2.numerator
        let d = op1.denominator * op2.denominator
        
        let result = try! Operand(numerator: n, denominator: d)
        return result
    }
}

func * (op1:Operand, op2:Operand) -> Operand {
    let op = MultiplyOperator()
    return op.apply(op1, with: op2)
}

func *= (inout op1:Operand, op2:Operand) {
    op1 = op1 * op2
}
