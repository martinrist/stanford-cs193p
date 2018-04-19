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

  private func newGame() {
    game = SetGame(boardSize: cardButtons.count)
   // game.shuffle()
    game.deal(numberOfCards: 12)
  }

  private func updateViewFromModel() {
    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.board[index]
      button.setTitle(renderCardTitle(for: card), for: .normal)

      if let card = card {
        if game.selectedCards.contains(card) {
          button.layer.borderWidth = 3.0
          button.layer.borderColor = UIColor.blue.cgColor
        } else {
          button.layer.borderWidth = 0.0
          button.layer.borderColor = UIColor.white.cgColor
        }
      }
    }

    if game.selectedCards.count == 3 {
      if game.isMatch(cards: game.selectedCards) {
        updateSelectedBorder(toColour: UIColor.green)
      } else {
        updateSelectedBorder(toColour: UIColor.red)
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

  private func renderCardTitle(for card: Card?) -> String {
    guard let card = card else { return "-" }

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
