//
//  SentanceTokenGenerator.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class SentanceTokenGenerator : TokenizerState {
    public init() {
        super.init(withTokenizers: [WhiteSpaceTokenGenerator(), WordTokenGenerator(), IntegerTokenGenerator()])
    }
}