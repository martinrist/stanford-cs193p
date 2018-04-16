//
//  ViewController.swift
//  Concentration
//
//  Created by Martin Rist on 12/01/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var game: Concentration!

    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var gameScoreLabel: UILabel!
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private  var cardButtons: [UIButton]!

    override func viewDidLoad() {
        newGame()
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }

    @IBAction private func newGame() {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        pickTheme()
        updateViewFromModel()
    }

    private func updateViewFromModel() {
        gameScoreLabel.text? = "Score: \(game.score)"
        flipCountLabel.text = "Flips: \(game.flipCount)"

        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]

            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : theme.foreground
            }
        }
    }

    private var theme: Theme!

    private let themes = [
        "halloween": Theme(emojiChoices: [ "🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"], background: UIColor.black, foreground: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        "sports"   : Theme(emojiChoices: [ "🏈", "⚽️", "⚾️", "🏏", "🎾", "🏉"], background: UIColor.green, foreground: UIColor.white),
        "animals"  : Theme(emojiChoices: [ "🐈", "🐩", "🐍", "🐌", "🦓", "🦁", "🐘"], background: UIColor.yellow, foreground: UIColor.black)
    ]

    private func pickTheme() {
        let themeIndex = Int(arc4random_uniform(UInt32(themes.count)))
        theme = Array(themes.values)[themeIndex]
        view.backgroundColor = theme.background
        flipCountLabel.textColor = theme.foreground
        gameScoreLabel.textColor = theme.foreground
        newGameButton.setTitleColor(theme.foreground, for: .normal)

    }

    private var emoji = [Card:String]()

    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, theme.emojiChoices.count > 0 {
            emoji[card] = theme.emojiChoices.remove(at: theme.emojiChoices.count.arc4random)
        }

        return emoji[card] ?? "?"
    }

}


struct Theme {
    var emojiChoices: [String]
    let background: UIColor
    let foreground: UIColor
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

