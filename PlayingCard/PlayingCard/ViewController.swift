//
//  ViewController.swift
//  PlayingCard
//
//  Created by Martin Rist on 23/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var deck = PlayingCardDeck()

  @IBOutlet weak var playingCardView: PlayingCardView! {
    didSet {
      let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
      swipe.direction = [.left, .right]
      playingCardView.addGestureRecognizer(swipe)

      let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
      playingCardView.addGestureRecognizer(pinch)
    }
  }

  @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
    switch sender.state {
    case .ended:
        playingCardView.isFaceUp.toggle()
    default: break
    }
  }

  @objc func nextCard() {
    if let card = deck.draw() {
      playingCardView.rank = card.rank.order
      playingCardView.suit = card.suit.rawValue
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}

extension Bool {
  mutating func toggle() {
    self = !self
  }
}
