//
//  SetGameViewController.swift
//  Set
//
//  Created by Martin Rist on 18/04/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {

  private var game: SetGame! {
    didSet {
      updateViewFromModel()
    }
  }

  @IBOutlet private var cardButtons: [UIButton]!
  @IBOutlet private weak var cardsRemainingLabel: UILabel!
  @IBOutlet private weak var scoreLabel: UILabel!
  @IBOutlet private weak var dealMoreCardsButton: UIButton!

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    newGame()
  }

  @IBAction private func touchCard(_ sender: UIButton) {
    if let cardNumber = cardButtons.index(of: sender),
      let selectedCard = game.board[cardNumber] {
      game.select(selectedCard)
    }
  }

  @IBAction func dealMoreCards(_ sender: Any) {
    if game.isMatch(cards: game.selectedCards) {
      game.removeSelectedFromBoard()
    }
    game.deal(numberOfCards: 3)
    game.selectedCards.removeAll()
  }

  @IBAction func newGame(_ sender: Any) {
    newGame()
  }

  private func newGame() {
    game = SetGame(boardSize: cardButtons.count)
    game.shuffle()
    game.deal(numberOfCards: 12)
  }

  private func updateViewFromModel() {

    cardsRemainingLabel.text = "Cards Left: \(game.deck.count)"
    scoreLabel.text = "Score: \(game.score)"

    if game.deck.count == 0 || (game.firstEmptySpace == nil &&
      !game.isMatch(cards: game.selectedCards)) {
      dealMoreCardsButton.isEnabled = false
    } else {
      dealMoreCardsButton.isEnabled = true
    }

    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.board[index]

      if let card = card {
        button.isEnabled = true
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 8.0

        button.setAttributedTitle(renderCardTitle(for: card), for: .normal)

        if game.selectedCards.contains(card) {
          button.layer.borderColor = UIColor.blue.cgColor
        } else {
          button.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
        }
      } else {
        button.isEnabled = false
        button.setTitle(nil, for: .normal)
        button.setAttributedTitle(nil, for: .normal)
        button.layer.borderWidth = 0.0
        button.layer.borderColor = UIColor.white.cgColor
      }
    }

    if game.selectedCards.count == 3 {
      if game.isMatch(cards: game.selectedCards) {
        updateSelectedBorder(toColour: .green)
      } else {
        updateSelectedBorder(toColour: .red)
      }
    }

  }

  func updateSelectedBorder(toColour colour: UIColor) {
    for card in game.selectedCards {
      if let buttonIndex = game.board.index(of: card) {
        let button = cardButtons[buttonIndex]
        button.layer.borderWidth = 3.0
        button.layer.borderColor = colour.cgColor
      }
    }
  }

  private func renderCardTitle(for card: Card) -> NSAttributedString {

    let shape: Character

    switch card.shape {
      case .triangle:
        shape = "▲"
      case .circle:
        shape = "●"
      case .square:
        shape = "■"
    }
    let title = String(repeating: shape, count: card.number)

    let attributes: [NSAttributedStringKey : Any] = [
      NSAttributedStringKey.foregroundColor: foregroundColour(for: card),
      NSAttributedStringKey.strokeWidth: strokeWidth(for: card),
      NSAttributedStringKey.strokeColor: foregroundColour(for: card)
    ]

    return NSAttributedString(string: title, attributes: attributes)
  }

  private func foregroundColour(for card: Card) -> UIColor {
    var colour: UIColor

    switch card.colour {
    case .red:
      colour = .red
    case .green:
      colour = .green
    case .blue:
      colour = .blue
    }

    switch card.shading {
    case .clear:
      return colour
    case .solid:
      return colour.withAlphaComponent(1.0)
    case .striped:
      return colour.withAlphaComponent(0.25)
    }

  }

  private func strokeWidth(for card: Card) -> Int {
    switch card.shading {
    case .clear:
      return 5
    case .striped:
      return 0
    case .solid:
      return -5
    }
  }

}
