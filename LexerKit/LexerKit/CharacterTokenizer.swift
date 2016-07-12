//
//  CharacterTokenizer.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class CharacterTokenizer : Tokenizer {
    internal let matchedCharacters: String
    internal let name: String

    public init(named name: String, forCharacter char: Character) {
        self.matchedCharacters = "\(char)"
        self.name = name
        super.init(withTokenizers: [])
    }

    public init(named name: String, forString chars: String) {
        self.matchedCharacters = chars
        self.name = name
        super.init(withTokenizers: [])
    }

    public override func canTokenize(character: UnicodeScalar) -> Bool {
        for match in self.matchedCharacters.unicodeScalars {
            if match == character {
                return true
            }
        }

        return false
    }

    public override func tokenFor(character: UnicodeScalar) -> Token {
        return CharacterToken(named: self.name, forCharacter: character)
    }
}