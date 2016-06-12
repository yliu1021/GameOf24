//
//  Board.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

class Board {
    var players: [Player]

    var occupants: [[Occupant]]
    let width: Int
    let height: Int

    init(width: Int, height: Int, players: Player...) {
        self.players = players

        occupants = [[Occupant]]()
        self.width = width
        self.height = height

        resetBoard()
    }

    func resetBoard() {
        for player in players {
            player.resetAll()
        }

        occupants.removeAll()

        for i in 0 ..< height {
            var row = [Occupant]()
            for j in 0 ..< width {
                let location = Location(x: i, y: j)
                var type: OccupantType = OccupantType.BlockerType

                if i == 0 || i == height - 1 {
                    if (i + j) % 2 == 1 {
                        type = .BlockerType
                    } else {
                        type = .OperandType(nil)
                    }
                } else {
                    if j == 0 || j == width - 1 {
                        if (j + i) % 2 == 1 {
                            type = .BlockerType
                        } else {
                            type = .OperandType(nil)
                        }
                    } else {
                        if (j + i) % 2 == 1 {
                            type = .OperationType(nil)
                        } else {
                            type = .OperandType(nil)
                        }
                    }
                }

                let occupant = Occupant(type: type, location: location)
                row.append(occupant)
            }
            occupants.append(row)
        }
    }
}