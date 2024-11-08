//
//  ClipTrackerMainView.swift
//  ClipTracker
//
//  Created by Meinecke, Alexander on 08.11.24.
//

import SwiftUI

struct ClipTrackerMainView: View {
    var body: some View {
        VStack{
            copyLog(content: Text("LOnffdgdfgfhbdh jd"))
            copyLog(content: Text("Copy me 2"))
            copyLog(content: Text("Copy me 3"))
            copyLog(content: Text("Copy me 4"))
            copyLog(content: Text("Copy me 5"))
            Divider().saturation(0.1)
            
            Button(action: {
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
    
    let content: Text
    @State var isHovered: Bool = false
    
    var body: some View {
        Button(action: {
            print("Copy")
            }) {
                HStack(spacing: 20) {
                    content.lineLimit(1)
                    Image(systemName: "document.on.clipboard")
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
        
    }
}




#Preview {
    ClipTrackerMainView()
}
