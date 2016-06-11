//
//  Operation.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal protocol Operation {
    
    var precedence:Int {get set}
    
    func apply(op1:Operand, op2:Operand) -> Operand
    
}