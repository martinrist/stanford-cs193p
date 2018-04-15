//
//  ViewController.swift
//  Concentration
//
//  Created by Martin Rist on 12/01/2018.
//  Copyright © 2018 Martin Rist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game: Concentration!

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var gameScoreLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet var cardButtons: [UIButton]!

    override func viewDidLoad() {
        newGame()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }

    @IBAction func newGame() {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        pickTheme()
        updateViewFromModel()
    }

    func updateViewFromModel() {
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

    var theme: Theme!

    let themes = [
        "halloween": Theme(emojiChoices: [ "🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"], background: UIColor.black, foreground: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        "sports"   : Theme(emojiChoices: [ "🏈", "⚽️", "⚾️", "🏏", "🎾", "🏉"], background: UIColor.green, foreground: UIColor.white),
        "animals"  : Theme(emojiChoices: [ "🐈", "🐩", "🐍", "🐌", "🦓", "🦁", "🐘"], background: UIColor.yellow, foreground: UIColor.black)
    ]

    func pickTheme() {
        let themeIndex = Int(arc4random_uniform(UInt32(themes.count)))
        theme = Array(themes.values)[themeIndex]

        view.backgroundColor = theme.background
        flipCountLabel.textColor = theme.foreground
        gameScoreLabel.textColor = theme.foreground
        newGameButton.setTitleColor(theme.foreground, for: .normal)

    }

    var emoji = [Int:String]()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, theme.emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(theme.emojiChoices.count)))
            emoji[card.identifier] = theme.emojiChoices.remove(at: randomIndex)
        }

        return emoji[card.identifier] ?? "?"
    }

}


struct Theme {
    var emojiChoices: [String]
    let background: UIColor
    let foreground: UIColor
}
