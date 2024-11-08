//
//  ClipboardContentModel.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import Foundation

struct ClipboardContentModel<Content: Equatable>: Identifiable, Equatable {
    var id = UUID()
    
    let content: Content
    let date: Date
}
