//
//  ClipTrackerModel.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import Foundation
import SwiftUICore

struct ClipTrackerModel {
    var log: [ClipboardContentModel<String>] = []
    
    mutating func add(log content: String) {
        log.removeAll(where: { $0.content == content })
        
        if log.count > 4 {
            log.removeLast()
        }
        log.append(ClipboardContentModel(content: content, date: Date()))
        log.sort { $0.date > $1.date }
    }
    
    mutating func reset() {
        log.removeAll()
    }
    
    
    
}

