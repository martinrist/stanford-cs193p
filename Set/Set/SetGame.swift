//
//  Set.swift
//  Set
//
//  Created by Martin Rist on 18/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation
import GameplayKit

struct SetGame {

  var deck = [Card]()
  var board: [Card?]
  var selectedCards = [Card]()

  init(boardSize: Int) {
    for number in 1...3 {
      for shape in Card.Shape.allValues {
        for colour in Card.Colour.allValues {
          for shading in Card.Shading.allValues {
            let card = Card(number: number, colour: colour, shape: shape, shading: shading)
            deck += [card]
          }
        }
      }
    }

    deck = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: deck) as! [Card]
    board = Array(repeating: nil, count: boardSize)
  }

  mutating func deal() {
    guard deck.count > 0 else { return }
    if let index = firstEmptySpace {
      board[index] = deck.remove(at: 0)
    }
  }

  var firstEmptySpace: Int? {
    for index in 0..<board.count {
      if board[index] == nil {
        return index
      }
    }
    return nil
  }


  // Implement the matching rules for Set:
  //Three cards form a set iff they satisfy all of these conditions:
  //- They all have the same number or have three different numbers.
  //- They all have the same symbol or have three different symbols.
  //- They all have the same shading or have three different shadings.
  //- They all have the same color or have three different colors.
  //
  func isMatch(card1: Card, card2: Card, card3: Card) -> Bool {
    let cards = [card1, card2, card3]

    let numbers = cards.map { $0.number }
    let colours = cards.map { $0.colour }
    let shapes = cards.map { $0.shape }
    let shadings = cards.map { $0.shading }

    return (numbers.allMatch || numbers.allDifferent) &&
           (colours.allMatch || colours.allDifferent) &&
           (shapes.allMatch || shapes.allDifferent) &&
           (shadings.allMatch || shadings.allDifferent)
  }

}


extension Collection where Element: Hashable {
  var allMatch: Bool {
    return Set<Element>(self).count == 1
  }

  var allDifferent: Bool {
    return Set<Element>(self).count == self.count
  }
}




