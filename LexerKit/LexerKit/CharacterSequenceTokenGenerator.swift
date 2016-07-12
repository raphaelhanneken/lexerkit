//
//  CharacterSequenceTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class CharacterSequenceTokenGenerator: TokenizerState {
    internal func consolidateCharacters() -> String {
        var string = ""
        if let tokens = super.flushTokens() {
            for token in tokens {
                string += token.characters
            }
        }

        return string
    }
}