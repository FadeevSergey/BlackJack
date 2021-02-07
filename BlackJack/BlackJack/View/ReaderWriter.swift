//
//  Presenter.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 07.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

class ReaderWriter {
    let separatorEquals: String = "════════════════════════════════════════════════════════════════════════════════════════════"
    let separatorPoints: String = "┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈"
    let blackJackBanner: String = """
    ╔═══════════════════════════════════════════════════════════════════════════════════════════╗
    ║   ╭───────╮╭───╮    ╭───────╮╭───────╮╭───╮ ╭─╮  ╭─────╮╭───────╮╭───────╮╭───╮ ╭─╮╭──╮   ║
    ║   │ ╭─╮   ││   │    │  ╭─╮  ││       ││   │ │ │  ╰─╮   ││  ╭─╮  ││       ││   │ │ ││  │   ║
    ║   │ ╰─╯   ││   │    │  ╰─╯  ││   ╭───╯│   ╰─╯ │    │   ││  ╰─╯  ││   ╭───╯│   ╰─╯ ││  │   ║
    ║   │     ╭─╯│   │    │       ││   │    │     ╭─╯    │   ││       ││   │    │     ╭─╯│  │   ║
    ║   │ ╭─╮ ╰─╮│   ╰───╮│  ╭─╮  ││   ╰───╮│     ╰─╮╭───╯   ││  ╭─╮  ││   ╰───╮│     ╰─╮╰──╯   ║
    ║   │ ╰─╯   ││       ││  │ │  ││       ││   ╭─╮ ││       ││  │ │  ││       ││   ╭─╮ │╭──╮   ║
    ║   ╰───────╯╰───────╯╰──╯ ╰──╯╰───────╯╰───╯ ╰─╯╰───────╯╰──╯ ╰──╯╰───────╯╰───╯ ╰─╯╰──╯   ║
    ╚═══════════════════════════════════════════════════════════════════════════════════════════╝
    
    """
    let gameRulesMessage: String = """

    ╔═══════════════════════════════════════════════════════════════════════════════════════════╗
    ║                                          RULES                                            ║
    ║                               We play classic blackjack.                                  ║
    ║                                                                                           ║
    ║ At the beginning of each game, you place your bet. On the first circle, you get two       ║
    ║ cards face up. If the sum of your cards is 9, 10 or 11, then you can satisfy the rate     ║
    ║ After that, the dealer receives 1 card face up and 1 card face down. If after the first   ║
    ║ round the sum of your points is 21, then this is blackjack. Your bet is returned and you  ║
    ║ get x 1.5. At each new circle, you can take a new card or end the game. If you took a     ║
    ║ card and the sum of your points is more than 21, then the game ends and your bet goes to  ║
    ║ the dealer. If you finish the game and the sum of your points is more than the dealer's,  ║
    ║ or the dealer has more than 21, then you win and get x 1. Otherwise, the dealer wins and  ║
    ║ your bet goes to him. The dealer always draws cards as long as his total is less than 17. ║
    ║ The game continues until the sum of your points is not more than 21, or you do not want   ║
    ║ to finish.                                                                                ║
    ╚═══════════════════════════════════════════════════════════════════════════════════════════╝

    """
    let gameOverMessage: String = """
    ╭───────────╮
    │ GAME OVER │
    ╰───────────╯
    """
    
    let youCanHitOrPassMessage = """
    ╭───────────────────────────────╮
    │ You can hit or pass           │
    │ If you want to hit enter "h"  │
    │ If you want to pass enter "p" │
    ╰───────────────────────────────╯
    """
    
    let comeBackMessage = """
    ╭─────────────────────────────────╮
    │ Come back again, we'll wait :-) │
    ╰─────────────────────────────────╯
    """
    
    let itsShameThatYouLose = """
    ╭──────────────────────────────────────────────────────╮
    │ It's a shame that you lost all your money :(.        │
    │ And at home, meanwhile, the wife is waiting ...      │
    │ The children are hungry ...                          │
    │ We hope you believe we'll come back, we'll wait :-)) │
    ╰──────────────────────────────────────────────────────╯
    """
    
    let letsStartMessage = """
    ╭────────────────────────────────────────────╮
    │ Let's start? Press enter to start the game │
    ╰────────────────────────────────────────────╯
    """
    
    let wantToPlayNewGameMessage = """
    ╭────────────────────────────────╮
    │ Want to play a new game?       │
    │ Enter "y" if you like          │
    │ Enter "n" if you don't want to │
    ╰────────────────────────────────╯
    """
    
    let canDoublingRateMessage = """
    ╭────────────────────────────────╮
    │ You can double your rate       │
    │ Enter "y" if you like          │
    │ Enter "n" if you don't want to │
    ╰────────────────────────────────╯
    """
    
    let resultCardsMessage = """
    ╭──────────────╮
    │ Result cards │
    ╰──────────────╯
    """
    
    let toFindOutTheRulesMessage = #"  To find out the rules of the game, enter "r". To start the game press Enter."#
    
    let welcomeMessage = "  Welcome to classic blackjack. How much money are you willing to lose today?"
    
    func playerWantPlayNewGame() -> Bool {
        print(wantToPlayNewGameMessage)
        print("  ", terminator: "")
        return readYesOrNo()
    }
    
    func printPoints(points: UInt) {
        print("  Points - \(points)")
    }
    
    func printResultCardsMessage() {
        printEqualsSeparator()
        print(resultCardsMessage)
    }
    func printGameOver() {
        print(gameOverMessage)

        printEqualsSeparator()
    }
    
    func printWinner(winner: Winner) {
        printEqualsSeparator()
        print("  Winner - \(winner)")
        printEqualsSeparator()
    }
    
    func playerWantsGetNewCard() -> Bool {
        print(youCanHitOrPassMessage)
        print("  ", terminator: "")
        var playerChoice = readLine()
        while playerChoice.lowercased() != "h" && playerChoice.lowercased() != "p" {
            print(#"  Enter "h" or "p" "#)
            print("  ", terminator: "")
            playerChoice = readLine()
        }
        
        if playerChoice.lowercased() == "p" {
            return false
        }
        return true
    }
    
    func printPointsSeparator() {
        print(separatorPoints)
    }
    
    func printEqualsSeparator() {
        print(separatorEquals)
    }
    func printGoodBye(playerMoney: UInt) {
        if playerMoney == 0 {
            print(itsShameThatYouLose)
        } else {
            print(comeBackMessage)
            
        }
    }
    
    func printCircleNumber(circleNumber: UInt) {
        printEqualsSeparator()
        
        print("╭──────────────────╮")
        print("│ Circle number ", circleNumber, "│")
        print("╰──────────────────╯")
    }
    
    func printHand(name: String, hand: [Card], hideSecondCard: Bool) {
        print ("  \(name)")
        for numberOfString in 0..<hand[0].frontView.count {
            for i in 0..<hand.count {
                if hideSecondCard && i == 1 {
                    print(hand[i].backView[numberOfString], terminator: "")
                } else {
                    print(hand[i].frontView[numberOfString], terminator: "")
                }
            }
            print()
        }
    }
    
    func suggestDoubling() -> Bool {
        printEqualsSeparator()
        print(canDoublingRateMessage)
        print("  ", terminator: "")
        return readYesOrNo()
    }
    
    func readYesOrNo() -> Bool {
        var playerChoice = readLine()
        while playerChoice.lowercased() != "y" && playerChoice.lowercased() != "n" {
            print(#"  Enter "y" or "n" "#)
            print("  ", terminator: "")
            playerChoice = readLine()
        }
           
        if playerChoice.lowercased() == "n" {
            return false
        }
        return true
    }

    func readNewRate(playerMoney: UInt) -> UInt {
        var rate: UInt?
        print("  Enter new rate no more \(playerMoney): ", terminator: "")
        while rate == nil {
            let tempRate = UInt(readLine())
            // can use "!" because "if" is lazy
            if tempRate != nil && tempRate! > 0 && tempRate! <= playerMoney  {
                rate = tempRate
            } else {
                print("  Invalid rate. Enter a natural number: ", terminator: "")
            }
        }

        // can use "!" because rate definitely not nil
        return rate!
    }
    
    func printPlayerMoney(playerMoney: UInt) {
        print("  Amount you have left: \(playerMoney)")
    }
    
    func printLetsStart() {
        print(letsStartMessage)
        print("  ", terminator: "")
        _ = readLine()
    }
    
    func readWhetherRulesAreNeeded() {
        print("  ", terminator: "")
        let userAnswer = readLine()
        
        if userAnswer.lowercased() == "r" {
            printRules()
        }
    }

    func readPlayerMoney() -> UInt {
        var sum: UInt?
        while sum == nil {
            let tempSum = UInt(readLine())
            // can use "!" because "if" is lazy
            if tempSum != nil && tempSum! > 0 {
                sum = tempSum
            } else {
                print("  Invalid amount. Enter a natural number: ", terminator: "")
            }
        }
        printEqualsSeparator()
        // can use "!", because sum exactly initialized
        return sum!
    }
    
    func printAboutRules() {
        print(toFindOutTheRulesMessage)
    }
    func printRules() {
        print(gameRulesMessage)
    }
    func printFirstNotice() {
        printEqualsSeparator()
        print(welcomeMessage)
        print("  Enter a natural number: ", terminator: "")
    }
    
    func printNameOfGame() {
        print(blackJackBanner)
    }
    
    func readLine() -> String {
        let data = FileHandle.standardInput.availableData
        let line = String(data: data, encoding: .utf8)!
        return line.trimmingCharacters(in: .newlines)
    }
}
