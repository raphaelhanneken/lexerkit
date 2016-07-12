//
//  EscapedCharacterTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class EscapedCharacterTokenGenerator : CharacterSequenceTokenGenerator {
    internal let escapedCharacters = CharacterTokenizer(named: "EscapedCharacterTokenizer", forString: "\"rt0n\\")

    override public func canTokenize(character: UnicodeScalar) -> Bool {
        switch self.tokens.count {
        case 0:
            return character == "\\"
        case 1:
            return escapedCharacters.canTokenize(character)
        default:
            return false
        }
    }

    override public func tokenFor(character: UnicodeScalar) -> Token {
        return CharacterToken(named: "EscapedCharacter", forCharacter: character)
    }

    override public func flushTokens() -> [Token]? {
        let escapeCode = self.consolidateCharacters()
        return [Token(named: "EscapedCharacter", forCharacters: escapeCode)]
    }
}