//
//  AppDelegate.swift
//  LexerTest
//
//  Created by Raphael Hanneken on 30/10/15.
//  Copyright © 2015 Raphael Hanneken. All rights reserved.
//

import Cocoa
import LexerKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var windowController: MainWindowController?

  func applicationDidFinishLaunching(aNotification: NSNotification) {
    let windowController = MainWindowController()
    windowController.showWindow(self)
    self.windowController = windowController
  }

  func applicationWillTerminate(aNotification: NSNotification) {
    // Insert code here to tear down your application
  }
}

