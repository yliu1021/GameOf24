//
//  Occupant.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

struct Occupant {
    
    var type:OccupantType
    var location: Location

    init(type: OccupantType, location: Location) {
        self.type = type;
        self.location = location
    }
    
}

enum OccupantType {
    case OperandType(Operand?)
    case OperationType(Operator?)
    case BlockerType
}