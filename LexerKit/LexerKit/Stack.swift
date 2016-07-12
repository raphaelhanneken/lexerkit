//
//  Stack.swift
//  LexerKit
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Foundation


public class Stack<T> {
    private var stack : Array<T>

    public  var top : T? {
        get {
            if self.stack.count > 0 {
                return self.stack[self.stack.endIndex - 1]
            }
            return nil
        }
    }

    public var count : Int {
        get { return self.stack.count }
    }

    public var isEmpty : Bool {
        get { return self.stack.count == 0 }
    }

    public init() {
        self.stack = []
    }

    public func pop() -> T? {
        if self.stack.count > 0 {
            return self.stack.removeLast()
        } else {
            return nil
        }
    }

    public func push(object: T) {
        stack.append(object)
    }

    public func flush() {
        self.stack = []
    }
}
