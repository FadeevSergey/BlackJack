//
//  Controller.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 08.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

class Controller {
    var game: Game
    var readerWriter: ReaderWriter
        
    init() {
        game = Game()
        readerWriter = ReaderWriter()
    }
    
    func start() {
        readerWriter.printNameOfGame()
        readerWriter.printAboutRules()
        readerWriter.readWhetherRulesAreNeeded()
        readerWriter.printFirstNotice()
        game.setPlayerMoney(money: readerWriter.readPlayerMoney())
        readerWriter.printLetsStart()
        while game.playerWantsPlayNewGame && game.playerMoney > 0 {
            game.resetFields()

            readerWriter.printPlayerMoney(playerMoney: game.playerMoney)
            game.setRate(rate: readerWriter.readNewRate(playerMoney: game.playerMoney))
            while game.playerDrawsNewCard() {
                game.newCircle()
                readerWriter.printCircleNumber(circleNumber: game.circleNumber - 1)
                readerWriter.printHand(name: game.dealer.name, hand: game.dealer.carts(), hideSecondCard: true)
                readerWriter.printPointsSeparator()
                readerWriter.printHand(name: game.player.name, hand: game.player.carts(), hideSecondCard: false)
                readerWriter.printPoints(points: game.player.sum())
                
                if game.player.sum() >= 9 && game.player.sum() <= 11 && game.playerRate * 2 <= game.playerMoney{
                    let agreeDoubleRate = readerWriter.suggestDoubling()
                    
                    if agreeDoubleRate {
                        game.doubleTheRate()
                    }
                }
                
                if game.playerDrawsNewCard() {
                    let want = readerWriter.playerWantsGetNewCard()
                    if !want {
                        game.blockPlayer()
                    }
                }
            }
            game.newCircle()
            let winner = game.stopGameAndReturnWinner()
            readerWriter.printResultCardsMessage()
            readerWriter.printHand(name: game.dealer.name, hand: game.dealer.carts(), hideSecondCard: false)
            readerWriter.printPoints(points: game.dealer.sum())
            readerWriter.printPointsSeparator()
            readerWriter.printHand(name: game.player.name, hand: game.player.carts(), hideSecondCard: false)
            readerWriter.printPoints(points: game.player.sum())
            readerWriter.printWinner(winner: winner)
            game.changePlayerMoney()
            readerWriter.printPlayerMoney(playerMoney: game.playerMoney)
            if game.playerMoney > 0 {
                let playerWantsPlayNewGame = readerWriter.playerWantPlayNewGame()
                if !playerWantsPlayNewGame {
                    game.playerDoesntWantPlayNewGame()
                }
            }
            
        }
        readerWriter.printGoodBye(playerMoney: game.playerMoney)
    }
}
