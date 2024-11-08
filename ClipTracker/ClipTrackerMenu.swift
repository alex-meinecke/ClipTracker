//
//  ClipTrackerMenu.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import Foundation
import SwiftUI

class ClipTrackerMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let clipTrackerView = ClipTrackerMainView()
        let topView = NSHostingController(rootView: clipTrackerView)
        topView.view.frame.size = NSSize(width: 225, height: 225)
        
        let menuItem = NSMenuItem()
        menuItem.view = topView.view
        menu.addItem(menuItem)
        menu.addItem(NSMenuItem.separator())
        
        
        return menu
    }
}
