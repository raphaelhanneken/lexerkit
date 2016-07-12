//
//  IntegerToken.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class IntegerToken : Token {
    internal var val: Int!

    public init?(number: String) {
        super.init(named: "Integer", forCharacters: number)

        guard let num = Int(number) else {
            return
        }

        self.val = num
    }
}