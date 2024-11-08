//
//  ViewModel.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import Foundation
import Combine
import AppKit

class ViewModel: ObservableObject {
    @Published var clipTracker = ClipTrackerModel()
    
    func reset() {
        clipTracker.reset()
    }
    
    func copyLogToClipboard(_ content: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(content, forType: .string)
    }
    
    private var cancellable: AnyCancellable?
    var clipboardContent: String? {
        didSet{
            if let clipboardContent, clipboardContent != oldValue {
                clipTracker.add(log: clipboardContent)
                print("New pasteboard content: \(clipboardContent)")
            }
        }
    }
    
    init() {
        startMonitoringClipboard()
    }
    
    private func startMonitoringClipboard() {
        // Timer, der jede Sekunde das Clipboard überprüft
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.checkClipboard()
            }
    }
    
    private func checkClipboard() {
        let pasteboard = NSPasteboard.general
            
        clipboardContent = pasteboard.string(forType: .string)
    }
    
    deinit {
        cancellable?.cancel()
    }
}
