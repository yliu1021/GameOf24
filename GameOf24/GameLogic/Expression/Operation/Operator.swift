//
//  Operator.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal protocol Operator {
    
    var precedence:Int {get set}
    
    func apply(op1:Operand, with op2:Operand) throws -> Operand
    
}