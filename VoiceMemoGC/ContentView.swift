//
//  ContentView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    
    private var dati = Categories()
    
    var body: some View {
        
        
        
        NavigationStack {
            
            
            List{
                
                ForEach (dati.categoryArray){category in
                    NavigationLink (destination: (RecordingView())){
                        HStack{
                            Image(systemName: category.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:20)
                                .foregroundStyle(category.color)
                            Text(category.name)
                                
                        }
                    }
                }
            }
            .navigationTitle("Voice Memos")
            .toolbar {
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Edit")
                })
                
                
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
