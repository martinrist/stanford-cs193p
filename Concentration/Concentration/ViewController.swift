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
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }

    let emojiThemes = [
        "halloween": [ "🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"],
        "sports"   : [ "🏈", "⚽️", "⚾️", "🏏", "🎾", "🏉"],
        "animals"  : [ "🐈", "🐩", "🐍", "🐌", "🦓", "🦁", "🐘"]
    ]

    func pickTheme() {
        let themeIndex = Int(arc4random_uniform(UInt32(emojiThemes.count)))
        emojiChoices = Array(emojiThemes.values)[themeIndex]
    }

    var emojiChoices = [String]()

    var emoji = [Int:String]()

    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }

        return emoji[card.identifier] ?? "?"
    }

}

