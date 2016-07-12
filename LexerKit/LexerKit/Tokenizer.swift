//
//  Lexer.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class Tokenizer : TokenizerState {
    internal var states: Stack<TokenizerState>

    public override init(withTokenizers tokenizers: [Tokenizing]) {
        self.states = Stack<TokenizerState>()
        super.init(withTokenizers: tokenizers)
    }

    public convenience init() {
        self.init(withTokenizers: [])
    }

    public func tokenize(string: String) -> [Token] {
        self.states.push(self)

        for character in string.unicodeScalars {
            self.tokenize(character)
            if self.states.isEmpty {
                return self.tokens
            }
        }

        self.fullyUnwind()
        return self.tokens
    }

    internal func tokenize(character: UnicodeScalar) {
        if let state = self.states.top {
            if state.canTokenize(character) {
                let token = state.tokenFor(character)
                if let newContext = token as? NewContextToken where token.newContext() {
                    self.states.push(newContext.context)
                    self.tokenize(character)
                } else {
                    state.append(token)
                }
            } else {
                self.unwindState()
                self.tokenize(character)
            }
        } else {
            self.append(ErrorToken(forCharacter: character, withDescription: "Unrecognized Character."))
        }
    }

    internal func fullyUnwind() {
        while !self.states.isEmpty {
            self.unwindState()
        }
    }

    internal func unwindState() {
        guard let state = self.states.top else {
            return
        }

        self.states.pop()
        if let newState = self.states.top {
            if let currentStateTokens = state.flushTokens() {
                for token in currentStateTokens {
                    newState.append(token)
                }
            }
        } else {
            if let currentStateTokens = state.flushTokens() {
                tokens.appendContentsOf(currentStateTokens)
            }
        }
    }
}
