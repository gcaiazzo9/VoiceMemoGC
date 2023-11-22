//
//  ContentView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dati = Categories()
    private var recordCount = RecordingDatas()
    @State private var showingPopUp = false
    @State private var folderName = ""
   
    func submit() {
            print("You entered \(folderName)")
        dati.personalCategoryArray.append(recordCategory(name: folderName))
        }
        
    var body: some View {
        
        
        NavigationStack {
        
        
            VStack {
                List{
                    
                   
                    NavigationLink (destination: (RecordingView())){
                            HStack{
                                Image(systemName: "waveform")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:20)
                                    .foregroundStyle(Color.blue)
                                Text("All Recordings")
                                    .padding(.horizontal,5)
                                
                            } .badge(prova.sounds.count)
                        }
                    NavigationLink (destination: Text ("ciao")) {
                        HStack{
                            Image(systemName: "trash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:20)
                                .foregroundStyle(Color.blue)
                            Text("Recently Deleted")
                                .padding(.horizontal,5)
                        } .badge("0")
                    }
                    
                    
                    if(dati.personalCategoryArray.isEmpty){
                       
                    }else{
                               
                         Section (
                            header: Text ("My Folders")
                         ) {
                             NavigationLink (destination: Text ("Hello Guyz")) {
                                 ForEach (dati.personalCategoryArray) { personalCategory in
                                     HStack{
                                         Image(systemName: personalCategory.image)
                                             .resizable()
                                             .aspectRatio(contentMode: .fit)
                                             .frame(width:20)
                                             .foregroundStyle(personalCategory.color)
                                         Text(personalCategory.name)
                                             .padding(.horizontal, 5)
                                     }
                                 }
                            }
                         }
                        
                    }
                }
       
                .navigationTitle("Voice Memos")
                .toolbar {
                    EditButton()
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar)
                        {Button (action: {
                            
                            self.showingPopUp.toggle()
                            
                        }, label: {
                            
                            Image(systemName: "folder.badge.plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:35)
                                .padding(.leading, 320)
                            
                        }
                        )}
                    } .alert("New Folder", isPresented: $showingPopUp) {
                        TextField("Name", text: $folderName)
                        Button("Cancel", role: .cancel) {
                            print ("ciao")
                        }
                        Button("Save", action: submit)
                    }
                            
                     
                   
                    
            }

            }
                
           
                
            }
            
        
        }
        
        
    } 


#Preview {
    ContentView()
}
