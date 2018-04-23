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
  var score = 0

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

    board = Array(repeating: nil, count: boardSize)
  }

  mutating func shuffle() {
    deck = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: deck) as! [Card]
  }

  mutating func deal(numberOfCards: Int = 1) {
    guard deck.count >= numberOfCards else { return }

    for _ in 1...numberOfCards {
      if let index = firstEmptySpace {
        board[index] = deck.remove(at: 0)
      }
    }
  }

  mutating func removeSelectedFromBoard() {
    for (index, card) in board.enumerated() {
      if let card = card, selectedCards.contains(card) {
        board[index] = nil
      }
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

  mutating func select(_ card: Card) {

    // Deselect card if already selected, otherwise just select it
    if selectedCards.contains(card) && !isMatch(cards: selectedCards) {
      selectedCards.remove(at: selectedCards.index(of: card)!)
      return
    }

    if selectedCards.count == 2 && !selectedCards.contains(card) {
      if isMatch(cards: selectedCards + [card]) {
        score += 10
      } else {
        score -= 1
      }
    }

    // When any card is chosen and there are already 3 non-matching cards selected
    // deselect the non-matching cards and select the chosen card
    if selectedCards.count == 3 && !isMatch(cards: selectedCards) {
      selectedCards = [card]
      return
    }

    // When any card is chosen and there are already 3 matching cards, replace
    // those three matching cards with new ones from the deck
    if selectedCards.count == 3 && isMatch(cards: selectedCards) {
      removeSelectedFromBoard()
      deal(numberOfCards: 3)
      if selectedCards.contains(card) {
        selectedCards.removeAll()
      } else {
        selectedCards = [card]
      }
      return
    }

    selectedCards.append(card)


  }

  // Implement the matching rules for Set:
  //Three cards form a set iff they satisfy all of these conditions:
  //- They all have the same number or have three different numbers.
  //- They all have the same symbol or have three different symbols.
  //- They all have the same shading or have three different shadings.
  //- They all have the same color or have three different colors.
  //
  func isMatch(cards: [Card]) -> Bool {
    guard cards.count == 3 else { return false }

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





