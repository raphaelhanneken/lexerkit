//
//  AdvancedSentanceTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class AdvancedSentanceTokenGenerator : SentanceTokenGenerator {
  override public init() {
    super.init()
    self.tokenizers = [
      CharacterSequenceTokenGenerator(),
      WhiteSpaceTokenGenerator(),
      WordTokenGenerator(),
      IntegerTokenGenerator(),
      QuoteTokenGenerator(),
      CharacterTokenizer(named: "Punctuation", forString: "!,:'?./()!§$%&=-_;")
    ]
  }
}