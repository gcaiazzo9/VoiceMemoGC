//
//  RecordingView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 14/11/23.
//

import SwiftUI
import Foundation

struct RecordingView: View {
    var body: some View {
        
        
        
        NavigationStack {

            VStack {
                Spacer()
                Spacer()
                
                Image (systemName: "waveform")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:55)
                    .foregroundStyle(Color.gray)
                    .padding(10)
                Text ("No Recordings")
                    .font(.title2)
                    .bold()
                Text ("Voice memos you record will appear here.")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                
            Spacer()
                    
                ZStack {
                    Rectangle()
                        .frame(height: 140)
                        .foregroundStyle(Color.gray)
                        .opacity(0.1)
                        .ignoresSafeArea()
                    
                    
                    Circle()
                        .stroke(Color.gray, lineWidth: 3)
                        .aspectRatio(contentMode: .fit)
                        .frame (width: 65)
                        .foregroundStyle(Color.gray)
                    
                    Circle()
                        .aspectRatio(contentMode: .fit)
                        .frame (width: 55)
                        .foregroundStyle(Color.red)
                    
                }
                
            }
            .ignoresSafeArea()
            .navigationTitle("All Recordings")
            
        }
        
    }
}

#Preview {
    RecordingView()
}
