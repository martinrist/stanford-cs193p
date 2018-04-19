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
  @IBOutlet weak var cardsRemainingLabel: UILabel!

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    newGame()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction private func touchCard(_ sender: UIButton) {
    if let cardNumber = cardButtons.index(of: sender),
      let selectedCard = game.board[cardNumber] {
      game.select(selectedCard)
    }
  }

  @IBAction func dealMoreCards(_ sender: Any) {
    game.deal(numberOfCards: 3)
  }

  private func newGame() {
    game = SetGame(boardSize: cardButtons.count)
    //game.shuffle()
    game.deal(numberOfCards: 12)
  }

  private func updateViewFromModel() {

    cardsRemainingLabel.text = "Cards Remaining: \(game.deck.count)"

    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.board[index]

      if let card = card {
        button.isEnabled = true
        button.setTitle(renderCardTitle(for: card), for: .normal)

        if game.selectedCards.contains(card) {
          button.layer.borderWidth = 3.0
          button.layer.borderColor = UIColor.blue.cgColor
        } else {
          button.layer.borderWidth = 0.0
          button.layer.borderColor = UIColor.white.cgColor
        }
      } else {
        button.isEnabled = false
        button.setTitle(nil, for: .normal)
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

  private func renderCardTitle(for card: Card) -> String {

    var title = String(card.number)

    switch card.colour {
    case .red:
      title += "R"
    case .green:
      title += "G"
    case .blue:
      title += "B"
    }

    switch card.shape {
    case .triangle:
      title += "T"
    case .circle:
      title += "C"
    case .square:
      title += "S"
    }

    switch card.shading {
    case .clear:
      title += "X"
    case .solid:
      title += "Y"
    case .striped:
      title += "Z"
    }

    return title

  }

}
