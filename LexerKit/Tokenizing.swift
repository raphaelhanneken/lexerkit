//
//  LexicalScanner.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public protocol Tokenizing {
    // Checks if the supplied character can be tokenized.
    func canTokenize(character: UnicodeScalar) -> Bool

    // Returns the token for the supplied character.
    func tokenFor(character: UnicodeScalar) -> Token
}