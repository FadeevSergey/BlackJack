//
//  Diller.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 06.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

enum Winner {
    case player
    case dealer
    case draw
}
struct Game {
    private(set) var dealer: Hand = Hand(name: "")
    private(set) var player: Hand = Hand(name: "")
    private var deck: Deck
    
    private(set) var circleNumber: UInt = 1
    private(set) var playerMoney: UInt = 0
    private(set) var playerRate: UInt = 0
    private(set) var playerWantsPlayNewGame: Bool = true
    private var winner: Winner?
    
    init() {
        deck = Deck()
        resetFields()
    }
    
    init(countOfDeck: Int) {
        deck = Deck(countOfDeck: countOfDeck)
        resetFields()
    }
    
    init(newCards: [Card]) {
        deck = Deck(newCarts: newCards)
        resetFields()
    }
    
    mutating func resetFields() {
        dealer = Hand(name: "Dealer")
        player = Hand(name: "Player")
        
        circleNumber = 1
        playerRate = 0
    }
    
    mutating func setRate(rate: UInt) {
        playerRate = rate
    }
    mutating func setPlayerMoney(money: UInt) {
        playerMoney = money
    }

    mutating func newCircle() {
        var howManyCardsNeedGive = 1
        if circleNumber == 1 {
            howManyCardsNeedGive = 2
        }
        for _ in 1...howManyCardsNeedGive {
            if player.drawsNewCard {
                player.addCart(card: deck.getCart())
            }
            if dealer.drawsNewCard {
                dealer.addCart(card: deck.getCart())
            }
        }
        if dealer.sum() > 16 {
            dealer.blockHand()
        }
        if player.sum() > 21 {
            player.blockHand()
        }
        circleNumber += 1
    }
    
    mutating func stopGameAndReturnWinner() -> Winner {
        switch (player.condition(), dealer.condition()) {
        case (.blackJack, .blackJack):
            
            winner = .draw
        case (.blackJack, _):
            winner = .player
        case (.twentyOne, .twentyOne):
            winner = .draw
        case (.twentyOne, .blackJack):
            winner = .dealer
        case (.twentyOne, _):
            winner = .player
        case (.less(let playerPoints), .less(let dealerPoints)):
            if playerPoints > dealerPoints {
                winner = .player
            } else if playerPoints < dealerPoints {
                winner = .dealer
            } else {
                winner = .draw
            }
        case (.less(_), .busts(_)):
            winner = .player
        default:
            winner = .dealer
        }
        // can use "!", because winner exactly initialized
        return winner!
    }
    
    func playerDrawsNewCard() -> Bool {
        return player.drawsNewCard
    }
    
    func getPlayerCondition() -> HandCondition {
        return player.condition()
    }

    mutating func changePlayerMoney() {
        // in general, when called, the winner will definitely be initialized, but just in case...
        switch (winner ?? .draw, getPlayerCondition()) {
        case (.dealer, _):
            playerMoney -= playerRate
        case (.player, .blackJack):
            playerMoney += UInt(Double(playerRate) * 1.5)
        case (.player, _):
            playerMoney += playerRate
        case (.draw, _):
            playerMoney += 0
        }
    }
    
    mutating func doubleTheRate() {
        playerRate = playerRate * 2
    }
    
    mutating func blockPlayer() {
        player.blockHand()
    }
    
    mutating func playerDoesntWantPlayNewGame() {
        playerWantsPlayNewGame = false
    }
}
