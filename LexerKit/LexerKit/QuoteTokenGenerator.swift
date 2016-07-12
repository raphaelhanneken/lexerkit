//
//  QuoteTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


private let QUOTE_DELIMETER = "QuoteDelimeter"

public class QuoteTokenGenerator: CharacterSequenceTokenGenerator {
    public init() {
        super.init(withTokenizers: [EscapedCharacterTokenGenerator()])
    }

    private func openedAndClosed() -> Bool {
        var delimeterCount = 0
        for token in self.tokens {
            if token.name == QUOTE_DELIMETER {
                delimeterCount++
            }
        }

        return delimeterCount > 1
    }

    override public func canTokenize(character: UnicodeScalar) -> Bool {
        if self.tokens.count == 0 {
            return character == "\""
        }

        return !self.openedAndClosed()
    }

    override public func tokenFor(character: UnicodeScalar) -> Token {
        if self.tokens.count == 0 {
            return Token(named: QUOTE_DELIMETER, forCharacters: "\(character)")
        }

        if super.canTokenize(character) {
            return super.tokenFor(character)
        }

        if character == "\"" {
            return Token(named: QUOTE_DELIMETER, forCharacters: "\(character)")
        } else {
            return CharacterToken(named: "Quote", forCharacter: character)
        }
    }

    override public func flushTokens() -> [Token]? {
        let quotedString = self.consolidateCharacters()
        return [Token(named: "Quote", forCharacters: quotedString)]
    }
}