//
//  EmailTextProviderTests.swift
//  EmoryTests
//
//  Created by 鶴見駿 on 2024/12/24.
//

import XCTest
@testable import Emory

final class EmailTextProviderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testReturnCorrectEmail() throws {
        let emailInputManager = EmailInputManager()
        let input = "cnj14098@ict."
        
        let wrongInput = "cnj14098@"
        
        let sendedAddress = emailInputManager.getNitechEmailAddress(address: input)
        let wrongSendedAddress = emailInputManager.getNitechEmailAddress(address: wrongInput)
        
        let expected = "cnj14098@ict.nitech.ac.jp"
        
        XCTAssertEqual(expected, sendedAddress, "メールアドレスが正しくありません")
        XCTAssertNotEqual(expected, wrongSendedAddress, "不正です")
    }
}
