//
//  Card.swift
//  Set
//
//  Created by Martin Rist on 18/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

struct Card {

  enum Colour {
    // TODO: Make these more generic
    case red, green, blue
    static let allValues = [red, green, blue]
  }

  enum Shape {
    // TODO: Make these more generic
    case triangle, circle, square
    static let allValues = [triangle, circle, square]
  }

  enum Shading {
    // TODO: Make these more generic
    case solid, striped, clear
    static let allValues = [solid, striped, clear]
  }

  let number: Int
  let colour: Colour
  let shape: Shape
  let shading: Shading
  
}

extension Card: Equatable {
  static func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.number  == rhs.number
        && lhs.colour  == rhs.colour
        && lhs.shape   == rhs.shape
        && lhs.shading == rhs.shading
  }
}
