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

    var flipCount = 0
    var score = 0
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newIndex) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newIndex)
            }
        }
    }

    func chooseCard(at index: Int) {

        if !cards[index].isMatched {

            if indexOfOneAndOnlyFaceUpCard == nil {
                flipCount += 1
            }

            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {

                flipCount += 1

                if cards[matchIndex].identifier == cards[index].identifier {

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
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
}
