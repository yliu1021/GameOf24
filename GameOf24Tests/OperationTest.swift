//
//  OperationTest.swift
//  GameOf24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import XCTest

class OperationTest: XCTestCase {
    
    func testAdd() {
        var op1 = try! Operand(numerator: 3, denominator: 5)
        var op2 = try! Operand(numerator: 1, denominator: 5)
        var result = op1 + op2
        XCTAssertEqual(result, try! Operand(numerator: 4, denominator: 5))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: 5, denominator: 4)
        result = op1 + op2
        XCTAssertEqual(result, try! Operand(numerator: 2, denominator: 1))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: -1, denominator: 4)
        result = op1 + op2
        XCTAssertEqual(result, try! Operand(numerator: 1, denominator: 2))
        
        op1 = try! Operand(numerator: 3, denominator: 5)
        op2 = try! Operand(numerator: 2, denominator: 7)
        result = op1 + op2
        XCTAssertEqual(result, try! Operand(numerator: 31, denominator: 35))
    }
    
    func testSubtract() {
        var op1 = try! Operand(numerator: 3, denominator: 5)
        var op2 = try! Operand(numerator: 1, denominator: 5)
        var result = op1 - op2
        XCTAssertEqual(result, try! Operand(numerator: 2, denominator: 5))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: 5, denominator: 4)
        result = op1 - op2
        XCTAssertEqual(result, try! Operand(numerator: -1, denominator: 2))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: -1, denominator: 4)
        result = op1 - op2
        XCTAssertEqual(result, try! Operand(numerator: 1, denominator: 1))
        
        op1 = try! Operand(numerator: 3, denominator: 5)
        op2 = try! Operand(numerator: 2, denominator: 7)
        result = op1 - op2
        
        XCTAssertEqual(result, try! Operand(numerator: 11, denominator: 35))
    }
    
    func testMultiply() {
        var op1 = try! Operand(numerator: 3, denominator: 5)
        var op2 = try! Operand(numerator: 1, denominator: 5)
        var result = op1 * op2
        XCTAssertEqual(result, try! Operand(numerator: 3, denominator: 25))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: 5, denominator: 4)
        result = op1 * op2
        XCTAssertEqual(result, try! Operand(numerator: 15, denominator: 16))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: -1, denominator: 4)
        result = op1 * op2
        XCTAssertEqual(result, try! Operand(numerator: -3, denominator: 16))
        
        op1 = try! Operand(numerator: 3, denominator: 5)
        op2 = try! Operand(numerator: 7, denominator: 9)
        result = op1 * op2
        XCTAssertEqual(result, try! Operand(numerator: 7, denominator: 15))
    }
    
    func testDivide() {
        var op1 = try! Operand(numerator: 3, denominator: 5)
        var op2 = try! Operand(numerator: 1, denominator: 5)
        var result = try! op1 / op2
        XCTAssertEqual(result, try! Operand(numerator: 3, denominator: 1))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: 5, denominator: 4)
        result = try! op1 / op2
        XCTAssertEqual(result, try! Operand(numerator: 3, denominator: 5))
        
        op1 = try! Operand(numerator: 3, denominator: 4)
        op2 = try! Operand(numerator: -1, denominator: 4)
        result = try! op1 / op2
        XCTAssertEqual(result, try! Operand(numerator: -3, denominator: 1))
        
        op1 = try! Operand(numerator: 3, denominator: 5)
        op2 = try! Operand(numerator: 2, denominator: 7)
        result = try! op1 / op2
        XCTAssertEqual(result, try! Operand(numerator: 21, denominator: 10))
        
        op1 = try! Operand(numerator: 3, denominator: 5)
        op2 = try! Operand(numerator: 0, denominator: 4)
        XCTAssertThrowsError(try op1 / op2)
    }
    
}
