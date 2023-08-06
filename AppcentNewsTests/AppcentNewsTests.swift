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

    // JUST Simple tests for the stringDateConvert's extention
    func testStringDateFormatter() throws {
        let dateString = "2023-07-25T09:49:51Z"
        XCTAssertTrue("Jul 25" == dateString.dateConvert(to: .MONTHNAME_DAY))
        XCTAssertTrue("2023-07-25T13:19:51.000Z" == dateString.dateConvert(to: .ISO_STANDARD))
        XCTAssertTrue("2023-07-25T13:19:51+0330" == dateString.dateConvert(to: .ISO))
        XCTAssertTrue("25.07.23" == dateString.dateConvert(to: .SHORT_WITH_DOTS))
        XCTAssertTrue("07/25/2023" == dateString.dateConvert(to: .SHORT_WITH_SLASH))
        XCTAssertTrue("07-25-2023 13:19" == dateString.dateConvert(to: .DAY_MONTH_YEAR_HOUR_MINIUTE))
        XCTAssertTrue("Jul 25, 1:19 PM" == dateString.dateConvert(to: .MONTHNAME_DAY_HOUR_MINIUTE_AMPM))
        XCTAssertTrue("Tuesday, Jul 25, 2023" == dateString.dateConvert(to: .DAYOFWEEK_MONTHNAME_DAY_YEAR))
        XCTAssertTrue("2023" == dateString.dateConvert(to: .FOUR_DIGIT_YEAR))
        XCTAssertTrue("23" == dateString.dateConvert(to: .TWO_DIGIT_YEAR))
        XCTAssertTrue("07" == dateString.dateConvert(to: .TWO_DIGIT_MONTH))
        XCTAssertFalse("08" == dateString.dateConvert(to: .TWO_DIGIT_MONTH))
        XCTAssertNil(dateString.dateConvert(from: .ISO_STANDARD, to: .AM_PM_12_HOUR_FORMAT))
        XCTAssertNotNil(dateString.dateConvert(from: .ISO, to: .AM_PM_12_HOUR_FORMAT))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
