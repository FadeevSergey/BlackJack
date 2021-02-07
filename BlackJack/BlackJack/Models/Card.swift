//
//  Card.swift
//  BlackJack
//
//  Created by Сергей Фадеев on 07.10.2020.
//  Copyleft (ɔ) 2020 φλεξ. No rights reserved.
//

import Foundation

enum Card {
    case    ace(name: String, valueIfFirst: UInt, valueIfNotFirst: UInt)
    case notAce(name: String, value: UInt)
    
    static let possibleValues: [Card] = [
        .notAce(name: "2",          value: 2),
        .notAce(name: "3",          value: 3),
        .notAce(name: "4",          value: 4),
        .notAce(name: "5",          value: 5),
        .notAce(name: "6",          value: 6),
        .notAce(name: "7",          value: 7),
        .notAce(name: "8",          value: 8),
        .notAce(name: "9",          value: 9),
        .notAce(name: "10",         value: 10),
        .notAce(name: "Jack",       value: 10),
        .notAce(name: "Queen",      value: 10),
        .notAce(name: "King",       value: 10),
        .ace(name:    "Ace", valueIfFirst: 11, valueIfNotFirst: 1)
    ]
    
    var name: String {
        switch self {
            case    .ace(name: let name, valueIfFirst: _, valueIfNotFirst: _): return name
            case .notAce(name: let name, value: _):                            return name
        }
    }
    
    var isAce: Bool {
        name == "Ace"
    }
    
    var valueIfFirst: UInt {
        switch self {
            case    .ace(name: _, valueIfFirst: let aceValue, valueIfNotFirst: _): return aceValue
            case .notAce(name: _,        value: let value):                     return value
        }
    }
    
    var valueIfNotFirst: UInt {
        switch self {
            case    .ace(name: _, valueIfFirst: _, valueIfNotFirst: let aceValue): return aceValue
            case .notAce(name: _,        value: let value):                     return value
        }
    }

    var frontView: [String] {
        var result = [
        "╭──────╮",
        "│\(sumbol)     │",
        "│   J  │",
        "│  B   │",
        "│     \(sumbol)│",
        "╰──────╯"
        ]
        
        // On all cards except 10, the symbol length is 1.
        // We remove the spaces if 10, so that the lines does not move out
        if name == "10" {
            result[1].remove(at: result[1].index(result[1].startIndex, offsetBy: 3))
            result[4].remove(at: result[4].index(result[4].startIndex, offsetBy: 2))
        }
        
        return result
    }
    
    var backView: [String] {
        return [
        "╭──────╮",
        "│▒▒▒▒▒▒│",
        "│▒▒?J▒▒│",
        "│▒▒B?▒▒│",
        "│▒▒▒▒▒▒│",
        "╰──────╯"
        ]
    }
    
    private var sumbol: String {
        var index: String.Index
        if name == "10" {
            index = name.index(name.startIndex, offsetBy: 2)
        } else {
            index = name.index(name.startIndex, offsetBy: 1)
        }
        return String(name[..<index])
    }
}
