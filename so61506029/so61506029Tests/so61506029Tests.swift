//
//  so61506029Tests.swift
//  so61506029Tests
//
//  Created by Olha Pavliuk on 29.04.2020.
//  Copyright © 2020 Olha Pavliuk. All rights reserved.
//

import XCTest
@testable import so61506029

class so61506029Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMockNetwork() {
        let network = MockNetwork()
        network.func1()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
