//
// Created by Yuhan Liu on 6/11/16.
// Copyright (c) 2016 Yuhan Liu. All rights reserved.
//

import Foundation

class Player {
    var score = 0

    let availablePowerups = [Powerup]()
    let availableOperands: [Operand]
    let availableOperations: [Operator]

    init() {
        availableOperands = (1 ... 9).map {
            $0 </> 1
        }
        availableOperations = [AddOperator(), SubtractOperator(), MultiplyOperator(), DivideOperator()]
    }
}
