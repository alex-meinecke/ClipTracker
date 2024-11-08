//
//  ClipTrackerMainView.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import SwiftUI

struct ClipTrackerMainView: View {
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        VStack{
            Text("ClipTracker Log (\(viewModel.clipTracker.log.count))")
                .padding(.vertical, 2)
                .bold()
            
            ForEach(viewModel.clipTracker.log) { log in
                copyLog(content: log.content) {
                    withAnimation {
                        viewModel.copyLogToClipboard(log.content)
                    }
                }
                .id(log.content)
            }
            .animation(.default, value: viewModel.clipTracker.log)
            
            Spacer()
            Divider().saturation(0.1)
            
            Button(action: {
                withAnimation {
                    viewModel.reset()
                }
                print("Reset all")
            }) {
                Text("Reset all")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        
    }
    
}


struct copyLog: View {
    let content: String
    @State var isHovered: Bool = false
    let action: () -> Void
    
    var body: some View {
            
        Button(action: {
            action()
            print("Copied: \(content)")
            }) {
                HStack {
                    Text(content)
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: "document.on.clipboard")
                        .padding(.vertical, 3)
                }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(isHovered ? Color.blue.opacity(0.3) : Color.clear)
        .cornerRadius(8)
        .onHover { hovered in
            withAnimation {
                isHovered = hovered
            }
            print("Hovered")
        }
        .padding(.horizontal, 10)
    }
}




#Preview {
    
    ClipTrackerMainView(viewModel: ViewModel())
}
