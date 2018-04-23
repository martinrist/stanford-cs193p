//
//  ViewController.swift
//  PlayingCard
//
//  Created by Martin Rist on 23/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    var deck = PlayingCardDeck()

    for _ in 1...10 {
      if let card = deck.draw() {
        print("\(card)")
      }

    }
  }

}

