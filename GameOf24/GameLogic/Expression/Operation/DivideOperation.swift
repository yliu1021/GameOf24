//
//  DivideOperation.swift
//  GameOf24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal class DivideOperation: Operation {
    var precedence: Int = 10
    
    func apply(op1: Operand, with op2: Operand) throws -> Operand {
        guard op2.numerator != 0 else {
            throw DivideOperationError.DivideByZero
        }
        
        let n = op1.numerator * op2.denominator
        let d = op2.numerator * op1.denominator
        
        let result = try! Operand(numerator: n, denominator: d)
        return result
    }
}

func / (op1:Operand, op2:Operand) throws -> Operand {
    let op = DivideOperation()
    return try op.apply(op1, with: op2)
}

func /= (inout op1:Operand, op2:Operand) throws {
    op1 = try op1 / op2
}

enum DivideOperationError: ErrorType {
    case DivideByZero
}