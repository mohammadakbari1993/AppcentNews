//
//  AppcentNewsTests.swift
//  AppcentNewsTests
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import XCTest

@testable import AppcentNews

final class AppcentNewsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringDateFormatter() throws {
        let dateString = "2023-07-25T09:49:51Z"
        print(dateString.dateConvert(to: .MONTHNAME_DAY))
        XCTAssertTrue("Jul 25" == dateString.dateConvert(to: .MONTHNAME_DAY))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
