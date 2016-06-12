//
// Created by Yuhan Liu on 6/11/16.
// Copyright (c) 2016 Yuhan Liu. All rights reserved.
//

import Foundation

class Player {
    var score = 0

    var availablePowerups = [Powerup]()
    var availableOperands: [Operand]
    var availableOperations: [Operator]

    init() {
        availableOperands = (1 ... 9).map {
            $0 </> 1
        }
        availableOperations = [AddOperator(), SubtractOperator(), MultiplyOperator(), DivideOperator()]
    }

    func resetOperands() {
        availableOperands = (1 ... 9).map {
            $0 </> 1
        }
    }

    func resetOperations() {
        availableOperations = [AddOperator(), SubtractOperator(), MultiplyOperator(), DivideOperator()]
    }

    func resetScore() {
        score = 0;
    }

    func resetPowerups() {
        availablePowerups.removeAll()
    }

    func resetAll() {
        resetOperands()
        resetOperations()
        resetScore()
        resetPowerups()
    }
}
