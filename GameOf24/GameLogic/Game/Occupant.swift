//
//  Occupant.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

class Occupant {
    
    var type:OccupantType
    
    init(type:OccupantType) {
        self.type = type;
    }
    
}

enum OccupantType {
    case Operand
    case Operation
    case Blocker
}