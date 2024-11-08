//
//  ClipTrackerApp.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import SwiftUI

@main
struct ClipTrackerApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        Settings{
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    let menu = ClipTrackerMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        
        statusBarItem.button?.image = NSImage(named: NSImage.Name("square.and.arrow.up"))
        //statusBarItem.button?.title = "CT"
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.menu = menu.createMenu()
        
    }
    
}
