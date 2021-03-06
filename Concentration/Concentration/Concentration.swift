//
//  Concentration.swift
//  Concentration
//
//  Created by Martin Rist on 15/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation
import GameplayKit

class Concentration {

    private(set) var flipCount = 0
    private(set) var score = 0
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set(newIndex) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newIndex)
            }
        }
    }

    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),
               "Concentration.chooseCard(at: \(index)): chosen index not in cards")

        if !cards[index].isMatched {

            if indexOfOneAndOnlyFaceUpCard == nil {
                flipCount += 1
            }

            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {

                flipCount += 1

                if cards[matchIndex] == cards[index] {

                    // Cards matched - score +2
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2

                } else {

                    // Cards not matched
                    // Penalise 1 point for each card previously in a mismatch
                    if cards[matchIndex].wasInvolvedInMismatch {
                        score -= 1
                    }
                    if cards[index].wasInvolvedInMismatch {
                        score -= 1
                    }
                    cards[matchIndex].wasInvolvedInMismatch = true
                    cards[index].wasInvolvedInMismatch = true
                }

                cards[index].isFaceUp = true

            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0,
               "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards)): must have at least 1 pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
}


extension Collection {
    var oneAndOnly: Element? {
      return count == 1 ? first : nil
    }
}
