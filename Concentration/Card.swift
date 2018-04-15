//
//  Card.swift
//  Concentration
//
//  Created by Martin Rist on 15/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    var wasInvolvedInMismatch = false

    static var identiferFactory = 0

    static func getUniqueIdentifier() -> Int {
        identiferFactory += 1
        return identiferFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
