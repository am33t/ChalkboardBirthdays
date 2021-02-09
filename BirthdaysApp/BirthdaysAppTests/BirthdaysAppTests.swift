//
//  BirthdaysAppTests.swift
//  BirthdaysAppTests
//
//  Created by Amit Tandel on 09/02/21.
//

import XCTest
@testable import BirthdaysApp

class BirthdaysAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBirthdayVMForNameVariations() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let names = [
            BirthdaysResponse.Name(title: "Mr", first: "Amit", last: "T"),
            BirthdaysResponse.Name(title: "", first: "Amit", last: "T"),
            BirthdaysResponse.Name(title: "", first: "", last: "T"),
            BirthdaysResponse.Name(title: "Mr", first: "Amit", last: ""),
            BirthdaysResponse.Name(title: nil, first: "Amit", last: "T"),
            BirthdaysResponse.Name(title: nil, first: "", last: "T"),
            BirthdaysResponse.Name(title: "Mr", first: nil, last: "Tandel"),
            BirthdaysResponse.Name(title: nil, first: nil, last: "Tandel")

        ]
        let fullNames = [
            "Mr. Amit T",
            "Amit T",
            "T",
            "Mr. Amit",
            "Amit T",
            "T",
            "Mr. Tandel",
            "Tandel"
        ]
        for (index, name) in names.enumerated() {
            let vm = BirthdayVM(birthday: BirthdaysResponse.Result(name: name, dob: nil))
            XCTAssertTrue(vm.name == fullNames[index])
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
