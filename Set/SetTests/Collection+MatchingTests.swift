//
//  Collection+MatchingTests.swift
//  SetTests
//
//  Created by Martin Rist on 19/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

class CollectionExtensionTests: XCTestCase {

  func testAllMatch() {
    XCTAssertFalse([1, 2, 3].allMatch)
    XCTAssertTrue([1].allMatch)
    XCTAssertTrue([1, 1].allMatch)
  }

  func testAllDifferent() {
    XCTAssertTrue([1, 2, 3].allDifferent)
    XCTAssertFalse([1, 1].allDifferent)
    XCTAssertTrue([1].allDifferent)
  }
}
