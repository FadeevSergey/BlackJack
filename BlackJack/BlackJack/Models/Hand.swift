//
//  DealerHand.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 06.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

enum HandCondition {
    case less(points: UInt)
    case busts(points: UInt)
    case twentyOne
    case blackJack
}

struct Hand {
    private(set) var name: String
    private(set) var cardsOnHead: [Card] = []
    private(set) var containsAce = false
    private(set) var sumOfCarts: UInt = 0
    private(set) var drawsNewCard = true
    
    init(name: String) {
        self.name = name
    }
    
    func carts() -> [Card] {
        return cardsOnHead
    }
    
    func sum() -> UInt {
        return sumOfCarts
    }
    
    mutating func addCart(card: Card) {
        cardsOnHead.append(card)
        
        if self.containsAce {
            sumOfCarts += card.valueIfNotFirst
        } else {
            sumOfCarts += card.valueIfFirst
        }
        
        if card.isAce {
            containsAce = true
        }
    }
    
    func condition() -> HandCondition {
        switch (sumOfCarts, cardsOnHead.count) {
        case (21, 2):
            return .blackJack
        case (21, _):
            return .twentyOne
        case (0..<21, _):
            return .less(points: sumOfCarts)
        default:
            return .busts(points: sumOfCarts)
        }
    }
    
    mutating func blockHand() {
        drawsNewCard = false
    }
}
