//
//  CharacterToken.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class CharacterToken : Token {
    public init(named name: String, forCharacter char: UnicodeScalar) {
        super.init(named: name, forCharacters: "\(char)")
    }
}