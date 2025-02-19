//
//  XCTestLoginUITests.swift
//  FunZoneUITests
//
//  Created by Kenneth Yang on 1/22/25.
//

import XCTest

final class XCTestLoginUITests: XCTestCase {

    func testLoginUI_Inputs_LoginButton(){
        let app = XCUIApplication()
        app.launch()
        let idTextField = app.textFields["id"]
        idTextField.tap()
        idTextField.typeText("abc")
        
        let passTextField = app.textFields["pass"]
        passTextField.tap()
        passTextField.typeText("123")
        
        app.buttons["login"].tap()
    }
}
