//
//  MainWindowController.swift
//  LexerTest
//
//  Created by Raphael Hanneken on 31/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Cocoa
import LexerKit
import LineNumberTextView

class MainWindowController: NSWindowController, NSWindowDelegate {

  @IBOutlet var textView: LineNumberTextView!
  @IBOutlet var tokenField: NSTokenField!

  var tokenizer: Tokenizer?

  override var windowNibName: String {
    return "MainWindowController"
  }

  override func windowDidLoad() {
    super.windowDidLoad()

    textView.gutterBackgroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 0.9, alpha: 1)
    textView.gutterForegroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 0.2, alpha: 1)

    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainWindowController.textDidChange(_:)), name: NSTextDidChangeNotification, object: textView)

    tokenizer = Tokenizer(withTokenizers: [AdvancedSentanceTokenGenerator()])
  }

  func textDidChange(notification: NSNotification) {
    parseText(textView.textStorage)
    printTokens()
  }

  func parseText(textStorage: NSTextStorage?) {
    guard let text = textStorage else {
      return
    }

    guard let tokenizer = tokenizer else {
      return
    }

    tokenizer.tokenize(text.string)
  }

  func printTokens() {
    guard let tokenizer = tokenizer else {
      return
    }
    var tokens: [String] = []

    for token in tokenizer.tokens {
      tokens.append(token.description())
    }

    tokenField.objectValue = tokens
  }
}
