//
//  ExpressionTest.swift
//  GameOf24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import XCTest

class ExpressionTest: XCTestCase {

    func testEvaluate() {
        let op1 = 3 </> 1
        let op2 = 4 </> 1
        let op3 = 2 </> 1
        
        let expression = Expression()
        try! expression.addToken(Token.OperandType(op1))
        try! expression.addToken(Token.OperationType(DivideOperator()))
        try! expression.addToken(Token.OperandType(op2))
        try! expression.addToken(Token.OperationType(AddOperator()))
        try! expression.addToken(Token.OperandType(op3))
        
        XCTAssertEqual(try! expression.evaluate(), try! op1 / op2 + op3)
        expression.clear()

        try! expression.addToken(Token.OperandType(op1))
        try! expression.addToken(Token.OperationType(AddOperator()))
        try! expression.addToken(Token.OperandType(op2))
        try! expression.addToken(Token.OperationType(MultiplyOperator()))
        try! expression.addToken(Token.OperandType(op3))

        XCTAssertEqual(try! expression.evaluate(), op1 + op2 * op3)

    }

}
