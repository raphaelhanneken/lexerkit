//
//  Token.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class Token {
    internal let name : String
    internal let characters : String

    public init(named: String, forCharacters chars: String) {
        self.name       = named
        self.characters = chars
    }

    public convenience init(named: String) {
        self.init(named: named, forCharacters: "")
    }

    public func description() -> String {
        return "\(self.name)Token for '\(self.characters)'"
    }

    public func newContext() -> Bool {
        return false
    }
}