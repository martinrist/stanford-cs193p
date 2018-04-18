//
//  SetTests.swift
//  SetTests
//
//  Created by Martin Rist on 18/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import XCTest
@testable import Set

class SetTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testNewDeckHas81Cards() {
    let game = SetGame(boardSize: 12)
    XCTAssert(game.deck.count == 81)
  }

  func testFirstSpaceIsEmpty() {
    let game = SetGame(boardSize: 12)
    XCTAssert(game.firstEmptySpace == 0)
  }

  func testFirstCardDealtToBoard() {
    var game = SetGame(boardSize: 12)
    let firstCard = game.deck[0]
    game.deal()
    XCTAssert(game.board[0] != nil)
    XCTAssert(game.board[0]! == firstCard)
    XCTAssert(!game.deck.contains(firstCard))
  }

  func testDealAllCardsToBoardThenBoardIsFull() {
    var game = SetGame(boardSize: 12)
    game.deal(numberOfCards: 12)
    XCTAssert(game.firstEmptySpace == nil)
    XCTAssert(game.deck.count == 81 - 12)
  }

  func testMatching() {
    let game = SetGame(boardSize: 12)
    let card1 = Card(number: 1, colour: .red, shape: .circle, shading: .clear)
    let card2 = Card(number: 2, colour: .red, shape: .square, shading: .clear)
    let card3 = Card(number: 3, colour: .red, shape: .triangle, shading: .clear)

    XCTAssertTrue(game.isMatch(card1: card1, card2: card2, card3: card3))
  }

  func testNotMatching() {
    let game = SetGame(boardSize: 12)
    let card1 = Card(number: 1, colour: .red, shape: .circle, shading: .clear)
    let card2 = Card(number: 2, colour: .red, shape: .square, shading: .clear)
    let card3 = Card(number: 2, colour: .red, shape: .triangle, shading: .clear)

    XCTAssertFalse(game.isMatch(card1: card1, card2: card2, card3: card3))
  }

  func testSelectThreeCardsFormingSet() {
    var game = SetGame(boardSize: 6)

    let card1 = Card(number: 1, colour: .red, shape: .circle, shading: .clear)
    let card2 = Card(number: 2, colour: .red, shape: .square, shading: .clear)
    let card3 = Card(number: 3, colour: .red, shape: .triangle, shading: .clear)
    let card4 = Card(number: 1, colour: .green, shape: .triangle, shading: .clear)
    let card5 = Card(number: 2, colour: .green, shape: .triangle, shading: .clear)
    let card6 = Card(number: 3, colour: .green, shape: .triangle, shading: .clear)

    let deck = [ card1, card2, card3, card4, card5, card6 ]
    game.deck = deck

    game.deal(numberOfCards: 3)
    game.select(card1)
    game.select(card2)
    game.select(card3)
    game.select(card4)

    XCTAssertEqual(game.selectedCards.count, 1)
    XCTAssertEqual(game.selectedCards[0], card4)
    XCTAssertFalse(game.board.contains(card1))
    XCTAssertFalse(game.board.contains(card2))
    XCTAssertFalse(game.board.contains(card3))
    XCTAssertTrue(game.board.contains(card4))
    XCTAssertTrue(game.board.contains(card5))
    XCTAssertTrue(game.board.contains(card6))

  }

  func testSelectThreeCardsNotFormingSet() {
    var game = SetGame(boardSize: 6)

    let card1 = Card(number: 1, colour: .red, shape: .circle, shading: .clear)
    let card2 = Card(number: 2, colour: .red, shape: .square, shading: .clear)
    let card3 = Card(number: 2, colour: .red, shape: .triangle, shading: .clear)
    let card4 = Card(number: 1, colour: .green, shape: .triangle, shading: .clear)
    let card5 = Card(number: 2, colour: .green, shape: .triangle, shading: .clear)
    let card6 = Card(number: 3, colour: .green, shape: .triangle, shading: .clear)

    let deck = [ card1, card2, card3, card4, card5, card6 ]
    game.deck = deck

    game.deal(numberOfCards: 3)
    game.select(card1)
    game.select(card2)
    game.select(card3)
    game.select(card4)

    XCTAssertEqual(game.selectedCards.count, 1)
    XCTAssertEqual(game.selectedCards[0], card4)
    XCTAssertTrue(game.board.contains(card1))
    XCTAssertTrue(game.board.contains(card2))
    XCTAssertTrue(game.board.contains(card3))
    XCTAssertFalse(game.board.contains(card4))
    XCTAssertFalse(game.board.contains(card5))
    XCTAssertFalse(game.board.contains(card6))
  }
}


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
