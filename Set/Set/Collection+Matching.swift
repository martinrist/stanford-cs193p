//
//  Collection+Matching.swift
//  Set
//
//  Created by Martin Rist on 19/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import Foundation

extension Collection where Element: Hashable {
  var allMatch: Bool {
    return Set<Element>(self).count == 1
  }

  var allDifferent: Bool {
    return Set<Element>(self).count == self.count
  }
}
