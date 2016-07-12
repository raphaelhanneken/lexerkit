//
//  NewContextToken.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class NewContextToken : Token {
    internal let context: TokenizerState

    public init(context: TokenizerState) {
        self.context = context
        super.init(named: "NewContextToken", forCharacters: "")
    }

    public override func newContext() -> Bool {
        return true
    }
}