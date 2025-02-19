//
//  XCTestLoginValidationTest.swift
//  FunZoneTests
//
//  Created by Kenneth Yang on 1/22/25.
//

import XCTest
@testable import FunZone
final class XCTestLoginValidationTest: XCTestCase {

    var valid : validation!
    override func setUp() {
        super.setUp()
        valid = validation()
    }

    func testValidation_Returns_true_IdPassNotEmpty() {
        XCTAssertTrue(valid.validationNull(id:"abc", password:"123"))
    }
    
    func testValidation_Returns_false_IdPassEmpty() {
        XCTAssertFalse(valid.validationNull(id:"", password:""))
    }
    
    func testValidation_Returns_false_IdNotEmpty_PassEmpty() {
        XCTAssertFalse(valid.validationNull(id:"abc", password:""))
    }
    
    func testValidation_Returns_false_IdEmpty_PassNotEmpty(){
        XCTAssertFalse(valid.validationNull(id:"", password:"123"))
    }
    
    override func tearDown() {
        valid = nil
        super.tearDown()
    }

}
