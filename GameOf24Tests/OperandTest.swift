//
//  OperandTest.swift
//  GameOf24
//
//  Created by Yuhan Liu on 6/11/16.
//  Copyright © 2016 Yuhan Liu. All rights reserved.
//

import XCTest

class OperandTest: XCTestCase {

    func testOperandInit() {
        let n = 3
        let d = 4
        guard let op = try? Operand(numerator: n, denominator: d) else {
            XCTFail("Couldn't initialize Operand:(\(n), \(d))")
            return
        }
        
        XCTAssertEqual(op.numerator, n, "Numerators not equal")
        XCTAssertEqual(op.denominator, d, "Denominators not equal")
    
        for n in -1...1 {
            let op = Operand(value: n)
            XCTAssertEqual(op.numerator, n, "Numerator not equal to initialized value")
            XCTAssertEqual(op.denominator, 1, "Denominator is not 1")
        }
    }
    
    func testOperandThrow() {
        for n in -1...1 {
            let d = 0
            XCTAssertThrowsError(try Operand(numerator: n, denominator: d), "Did not throw error")
        }
    }
    
    func testOperandSign() {
        for n in -2...2 {
            for d in -2...2 {
                guard d != 0 else {
                    continue
                }
                guard let op = try? Operand(numerator: n, denominator: d) else {
                    XCTFail("Couldn't initialize Operand(\(n), \(d))")
                    return
                }
                
                XCTAssertEqual(op.denominator * n, op.numerator * d, "\(op.numerator)/\(op.denominator) != \(n)/\(d)")
            }
        }
    }
    
    func testSimplify() {
        var n = 4
        var d = 6
        guard let op1 = try? Operand(numerator: n, denominator: d) else {
            XCTFail("Couldn't initialize Operand(\(n), \(d))")
            return
        }
        XCTAssertEqual(op1.numerator, n/2)
        XCTAssertEqual(op1.denominator, d/2)
        
        n = -4
        d = 6
        guard let op2 = try? Operand(numerator: n, denominator: d) else {
            XCTFail("Couldn't initialize Operand(\(n), \(d))")
            return
        }
        XCTAssertEqual(op2.numerator, n/2)
        XCTAssertEqual(op2.denominator, d/2)
        
        n = 4
        d = -6
        guard let op3 = try? Operand(numerator: n, denominator: d) else {
            XCTFail("Couldn't initialize Operand(\(n), \(d))")
            return
        }
        XCTAssertEqual(op3.numerator, -n/2)
        XCTAssertEqual(op3.denominator, -d/2)
        
        n = -4
        d = -6
        guard let op4 = try? Operand(numerator: n, denominator: d) else {
            XCTFail("Couldn't initialize Operand(\(n), \(d))")
            return
        }
        XCTAssertEqual(op4.numerator, -n/2)
        XCTAssertEqual(op4.denominator, -d/2)
    }
    
    func testPersistentDenominator() {
        let d = 4
        var op = try! Operand(numerator: 3, denominator: d)
        op.denominator = 0
        XCTAssertEqual(op.denominator, d, "Denominator changed to \(op.denominator)")
    }
    
    func testOperandNegate() {
        let op1 = try! Operand(numerator: 3, denominator: 5)
        XCTAssertEqual(-op1, try! Operand(numerator: -3, denominator: 5))
        let op2 = try! Operand(numerator: 4, denominator: 6)
        XCTAssertEqual(op2, -(-op2))
    }
    
    func testOperandEquality() {
        let op1 = try! Operand(numerator: 3, denominator: 5)
        let op2 = try! Operand(numerator: 3, denominator: 5)
        XCTAssertEqual(op1, op2)
        
        let op3 = try! Operand(numerator: 4, denominator: 6)
        let op4 = try! Operand(numerator: 2, denominator: 3)
        XCTAssertEqual(op3, op4)
    }
}
