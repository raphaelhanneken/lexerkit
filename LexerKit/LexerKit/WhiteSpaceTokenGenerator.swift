//
//  WhiteSpaceTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class WhiteSpaceTokenGenerator : CharacterSequenceTokenGenerator {
    internal let whitespaceTokenizer = CharacterTokenizer(named: "WhitespaceTokenizer", forString: " \t\n\r")

    public init() {
        super.init(withTokenizers: [self.whitespaceTokenizer])
    }

    override public func flushTokens() -> [Token]? {
        let whitespace = consolidateCharacters()
        return [Token(named: "Whitespace", forCharacters: whitespace)]
    }
}