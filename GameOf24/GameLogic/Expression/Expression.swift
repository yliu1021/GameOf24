//
//  Expression.swift
//  24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import Foundation

internal class Expression {
    private var tokens:[Token] = [Token]()
    
    func addToken(token:Token) throws {
        if tokens.isEmpty {
            if case .OperandType(_) = token {
                tokens.append(token)
                return
            }
            throw ExpressionError.IncorrectTokenAdded
        }
        
        guard let last = tokens.last else {
            throw ExpressionError.IncorrectTokenAdded
        }
        
        switch last {
        case .OperandType(_):
            if case .OperandType(_) = token {
                throw ExpressionError.IncorrectTokenAdded
            }
        case .OperationType(_):
            if case .OperationType(_) = token {
                throw ExpressionError.IncorrectTokenAdded
            }
        }
        tokens.append(token)
    }
    
    func evaluate() throws -> Operand {
        if tokens.isEmpty {
            return Operand(value: 0)
        }
        return try evaluateFrom(0, to: tokens.count - 1)
    }
    
    private func evaluateFrom(start:Int, to end:Int) throws -> Operand {
        let first = tokens[start]
        
        if end - start == 0 {
            if case let .OperandType(operand) = first {
                return operand
            } else {
                throw ExpressionError.ExpressionTokensIncorrectStart
            }
        }
        
        let last = tokens[end]
        
        guard case .OperandType(_) = first else {
            throw ExpressionError.ExpressionTokensIncorrectStart
        }
        guard case .OperandType(_) = last else {
            throw ExpressionError.ExpressionTokensIncomplete
        }
        
        let token = tokens[start+1]
        guard case let .OperationType(operation) = token else {
            throw ExpressionError.IncorrectTokenOrder
        }
        
        var operationTuple:(precedence:Int, op:Operation) = (operation.precedence, operation)
        var index = start + 1
        for i in (start+1).stride(to: end, by: 2) {
            let value = tokens[i]
            if case let .OperationType(op) = value {
                if op.precedence < operationTuple.precedence {
                    operationTuple = (op.precedence, op)
                    index = i
                }
            } else {
                throw ExpressionError.IncorrectTokenOrder
            }
        }
        
        let lhs = try evaluateFrom(start, to: index - 1)
        let rhs = try evaluateFrom(index + 1, to: end)
        return try operationTuple.op.apply(lhs, with: rhs)
    }
    
    func clear() {
        tokens.removeAll()
    }
}

enum Token {
    case OperandType(Operand)
    case OperationType(Operation)
}

enum ExpressionError: ErrorType {
    case IncorrectTokenAdded
    case ExpressionTokensIncomplete
    case ExpressionTokensIncorrectStart
    case IncorrectTokenOrder
}