//
//  MovieAppUITests.swift
//  MovieAppUITests
//
//  Created by Ikenna on 18/05/2021.
//

import XCTest

class MovieAppUITests: XCTestCase {

   
    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()

        let searchButton = app.buttons["searchButton"]
        searchButton.tap();

        let textField = app.textFields["textField"]
        XCTAssertEqual(true, textField.isHittable)

    }

    
    
}
