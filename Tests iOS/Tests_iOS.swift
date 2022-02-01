//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Alaina Thompson on 1/30/22.
//

import XCTest

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
    
    func testSphereInitialization() async {
        
            
            let n = 100
            
            let mySum = SimpleSeries()
            
            let _ = await mySum.initWithSum()
            
            let upSum = mySum.sUp
            
        XCTAssertEqual(sUp, 1/n, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            let downSum = mySum.sDown
            
            XCTAssertEqual(sDown, 1/n, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
