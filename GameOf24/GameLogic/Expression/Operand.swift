//
//  Operand.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal struct Operand: Equatable {
    var numerator: Int
    var denominator: Int {
        didSet {
            if denominator == 0 {
                denominator = oldValue
            }
        }
    }
    
    init(value:Int) {
        try! self.init(numerator: value, denominator: 1)
    }
    
    init(numerator:Int, denominator:Int) throws {
        guard denominator != 0 else {
            throw OperandError.DenominatorZero
        }
        
        var negative = false
        if numerator < 0 {
            negative = !negative
        }
        if denominator < 0 {
            negative = !negative
        }
        
        self.numerator = abs(numerator)
        self.denominator = abs(denominator)
        
        if negative {
            self.numerator *= -1;
        }
        
        simplify()
    }
    
    mutating func simplify() {
        let g = gcd(abs(numerator), abs(denominator))
        numerator /= g
        denominator /= g
    }

}

func == (rhs: Operand, lhs: Operand) -> Bool {
    return rhs.numerator == lhs.numerator && rhs.denominator == lhs.denominator
}

prefix func + (op:Operand) -> Operand {
    return op
}

prefix func - (op:Operand) -> Operand {
    var result = op
    result.numerator = -result.numerator
    return result
}

infix operator </> { associativity left precedence 150 }
func </> (rhs:Int, lhs:Int) -> Operand {
    return try! Operand(numerator: rhs, denominator: lhs)
}

enum OperandError:ErrorType {
    case DenominatorZero
}

extension OperandError:CustomStringConvertible {
    var description:String {
        switch self {
        case .DenominatorZero:
            return "Denominator is zero"
        }
    }
}

private func gcd(x: Int, _ y: Int) -> Int {
    var a = x
    var b = y
    while b != 0 {
        let t = b
        b = a % b
        a = t
    }
    return a
}