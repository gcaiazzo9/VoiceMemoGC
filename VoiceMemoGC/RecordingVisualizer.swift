//
//  RecordingVisualizer.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 14/11/23.
//

import SwiftUI

struct RecordingVisualizer: View {
    
    @State private var drawingHeight = true
    func bar(low: CGFloat = 0.0, high: CGFloat = 1.0) -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(.red.gradient)
            .frame(height: (drawingHeight ? high : low) * 64)
            .frame(height: 64, alignment: .center)
    }
    
    
    var body: some View {
        
        var animation: Animation {
            return .linear(duration: 0.5).repeatForever()
        }
        
        HStack {
            
               bar(low: 0.4)
                .animation(animation.speed(1.5), value: drawingHeight)
               bar(low: 0.3)
                .animation(animation.speed(1.2), value: drawingHeight)
               bar(low: 0.5)
                .animation(animation.speed(1.0), value: drawingHeight)
               bar(low: 0.3)
                .animation(animation.speed(1.7), value: drawingHeight)
               bar(low: 0.5)
                .animation(animation.speed(1.0), value: drawingHeight)
            bar(low: 0.4)
             .animation(animation.speed(1.5), value: drawingHeight)
            bar(low: 0.3)
             .animation(animation.speed(1.2), value: drawingHeight)
            bar(low: 0.5)
             .animation(animation.speed(1.0), value: drawingHeight)
            bar(low: 0.3)
             .animation(animation.speed(1.7), value: drawingHeight)
            bar(low: 0.5)
             .animation(animation.speed(1.0), value: drawingHeight)
            
        } .frame(width: 80)
            .onAppear{
                drawingHeight.toggle()
            }
    }
}

#Preview {
    RecordingVisualizer()
}
