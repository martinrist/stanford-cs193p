//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Martin Rist on 23/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {

  var description: String {
    return "\(rank.description)\(suit.description)"
  }


  let suit: Suit
  let rank: Rank

  enum Suit: String, CustomStringConvertible {
    var description: String {
      return rawValue
    }

    case hearts = "❤️"
    case clubs = "♣︎"
    case diamonds = "♦︎"
    case spades = "♠︎"

    static var all = [Suit.hearts, .clubs, .diamonds, .spades]
  }

  enum Rank: CustomStringConvertible {
    var description: String {
      switch self {
      case .ace:
        return "A"
      case .numeric(let pips):
        return String(pips)
      case .face(let kind):
        return kind
      }
    }
    
    case ace
    case face(String)
    case numeric(Int)

    var order: Int {
      switch self {
      case .ace: return 1
      case .numeric(let pips): return pips
      case .face(let kind) where kind == "J": return 11
      case .face(let kind) where kind == "Q": return 12
      case .face(let kind) where kind == "K": return 13
      default: return 0
      }
    }

    static var all: [Rank] {
      var allRanks: [Rank] = [.ace]
      for pips in 2...10 {
        allRanks.append(.numeric(pips))
      }
      allRanks += [.face("J"), .face("Q"), .face("K")]

      return allRanks
    }
  }
}
