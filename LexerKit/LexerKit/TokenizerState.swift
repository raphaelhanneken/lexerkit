//
//  LexerState.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class TokenizerState : Tokenizing {
    public var tokenizers:  [Tokenizing]
    public var tokens: [Token]

    public init(withTokenizers tokenizers: [Tokenizing]) {
        self.tokenizers = tokenizers
        self.tokens     = []
    }

    public convenience init() {
        self.init(withTokenizers: [])
    }

    // Fetches the correct lexer for the given character.
    public func tokenizerFor(character: UnicodeScalar) -> Tokenizing? {
        for tokenizer in self.tokenizers {
            if tokenizer.canTokenize(character) {
                return tokenizer
            }
        }

        return nil
    }

    public func canTokenize(character: UnicodeScalar) -> Bool {
        return self.tokenizerFor(character) != nil
    }

    public func tokenFor(character: UnicodeScalar) -> Token {
        if let tokenizer = self.tokenizerFor(character) {
            // If it's a state, create a new context token.
            if tokenizer is TokenizerState {
                return NewContextToken(context: tokenizer as! TokenizerState)
            } else {
                return tokenizer.tokenFor(character)
            }
        }

        return ErrorToken(forCharacter: character, withDescription: "Creating Token failed!")
    }

    // Adds a token to the stored state.
    public func append(token: Token) {
        self.tokens.append(token)
    }

    // Return all tokens in the stored state.
    public func flushTokens() -> [Token]? {
        let tokens  = self.tokens
        self.tokens = []
        return tokens
    }
}
