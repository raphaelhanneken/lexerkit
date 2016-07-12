//
//  ErrorToken.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation

public class ErrorToken : Token {
    internal let errorDescription : String

    public init(forCharacter char: UnicodeScalar, withDescription desc: String) {
        self.errorDescription = desc
        super.init(named: "Error", forCharacters: "\(char)")
    }

    public override func description() -> String {
        return "\(super.description())\n\t⌙ failed with message '\(self.errorDescription)'"
    }
}