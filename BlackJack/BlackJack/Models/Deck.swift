//
//  main.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 06.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

struct Deck {
    private var deck: [Card] = []
    private var primordialDeck: [Card] = []
    
    init() {
        addToDeck(newCarts: Card.possibleValues)
        deck.shuffle()
    }
    
    init(countOfDeck: Int) {
        for _ in 1 ... countOfDeck {
            addToDeck(newCarts: Card.possibleValues)
        }
        deck.shuffle()
    }
    
    init(newCarts: [Card]) {
        addToDeck(newCarts: newCarts)
        deck.shuffle()
    }
    
    mutating func getCart() -> Card {
        let result = deck.popLast()!
        if Double(deck.count) < Double(primordialDeck.count) * (0.66) {
            updateDeck()
        }
        return result
    }
    
    private mutating func addToDeck(newCarts: [Card]) {
        let numberOfSuits = 4
        for _ in 1 ... numberOfSuits {
            for card in newCarts {
                deck.append(card)
                primordialDeck.append(card)
            }
        }
    }
    
    private mutating func updateDeck() {
        deck = primordialDeck
        deck.shuffle()
    }
}


