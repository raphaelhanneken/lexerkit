//
//  IntegerTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class IntegerTokenGenerator: CharacterSequenceTokenGenerator {
    internal let intTokenizer = CharacterTokenizer(named: "IntegerTokenizer", forString: "1234567890")

    public init() {
        super.init(withTokenizers: [self.intTokenizer])
    }

    public override func flushTokens() -> [Token]? {
        let integer = self.consolidateCharacters()
        if let tokenizer = IntegerToken(number: integer) {
            return [tokenizer]
        }

        return nil
    }
}