//
//  WordTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class WordTokenGenerator: CharacterSequenceTokenGenerator {
    internal let wordTokenizer = CharacterTokenizer(named: "WordTokenizer", forString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

    public init() {
        super.init(withTokenizers: [self.wordTokenizer])
    }

    override public func flushTokens() -> [Token]? {
        let word = self.consolidateCharacters()
        return [Token(named: "Word", forCharacters: word)]
    }
}