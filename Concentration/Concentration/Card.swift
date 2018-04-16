//
//  Card.swift
//  Concentration
//
//  Created by Martin Rist on 15/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

struct Card: Hashable {


    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    var wasInvolvedInMismatch = false

    private static var identiferFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

    var hashValue: Int { return identifier }

    static func ==(lhs: Card, rhs: Card) -> Bool {
      return lhs.identifier == rhs.identifier
    }

}
