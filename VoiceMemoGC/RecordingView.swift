//
//  RecordingView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 14/11/23.
//

import SwiftUI
import Foundation
import AVFoundation


struct SheetView: View {
    
   
    @State private var recordedDatas = RecordingDatas()
    
    @Binding var record : Bool
    @Binding var showingSheet: Bool
    @Binding var records: [recording]
    @State private var drawingHeight = true
    func bar(low: CGFloat = 0.0, high: CGFloat = 1.0) -> some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(.red.gradient)
            .frame(height: (drawingHeight ? high : low) * 64)
            .frame(height: 64, alignment: .center)
    }
   
    @Environment(\.dismiss) var dismiss
    @Binding var musicRecording : VoiceViewModel
    @State private var someState = true
    @Binding var timeRemaining : Double
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    func fetchLastRecording(name: String, color: Color){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
        
        //sort
        let sortedContents = directoryContents.sorted { url1, url2 in
                return url1.lastPathComponent < url2.lastPathComponent
            }
        
        let i = sortedContents.last
        records.append(recording(name: "New Recording", fileURL: i!))
        
    }
    
    
    func deleteRecordingFile(sounds: recording) {
        let fileManager = FileManager.default

        do {
            print("fileURL da eliminare: \(sounds.fileURL)")
            try fileManager.removeItem(at: sounds.fileURL)
            records.removeAll { $0.id == sounds.id }
            print("file deleted")
        } catch {
            print("Error deleting file: \(error)")
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            print("directoryContent: \(directoryContents)")
        }
    }
    
    func emptyDirectory(atPath directoryPath: URL) {
        let fileManager = FileManager.default
        
        do {
            let contents = try fileManager.contentsOfDirectory(at: directoryPath, includingPropertiesForKeys: nil, options: [])
            for item in contents {
                try fileManager.removeItem(at: item)
            }
        } catch {
            print("Error emptying directory: \(error)")
        }
    }
    
    
    var body: some View {
       
        var animation: Animation {
            return .linear(duration: 0.5).repeatForever()
        }
        
        ZStack {
            Color.gray
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                
                Text ("New Recording")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
               
                    Text("\(timeRemaining, specifier: "%.2f")")
                        .foregroundStyle(Color.gray)
                        .onReceive(timer) { time in
                            timeRemaining += 0.01
                         }
                
                HStack {
                    
                       bar(low: 0.4)
                        .animation(animation.speed(0.8), value: drawingHeight)
                       bar(low: 0.3)
                        .animation(animation.speed(0.3), value: drawingHeight)
                       bar(low: 0.5)
                        .animation(animation.speed(1.0), value: drawingHeight)
                       bar(low: 0.3)
                        .animation(animation.speed(0.6), value: drawingHeight)
                       bar(low: 0.5)
                        .animation(animation.speed(0.5), value: drawingHeight)
                       bar(low: 0.4)
                        .animation(animation.speed(0.8), value: drawingHeight)
                       bar(low: 0.3)
                        .animation(animation.speed(0.3), value: drawingHeight)
                       bar(low: 0.5)
                     .animation(animation.speed(1.0), value: drawingHeight)
                       bar(low: 0.3)
                        .animation(animation.speed(0.6), value: drawingHeight)
                      bar(low: 0.5)
                        .animation(animation.speed(0.5), value: drawingHeight)
                      bar(low: 0.4)
                        .animation(animation.speed(0.8), value: drawingHeight)
                      bar(low: 0.3)
                        .animation(animation.speed(0.3), value: drawingHeight)
                      bar(low: 0.5)
                        .animation(animation.speed(1.0), value: drawingHeight)
                      bar(low: 0.3)
                        .animation(animation.speed(0.6), value: drawingHeight)
                     bar(low: 0.5)
                        .animation(animation.speed(0.5), value: drawingHeight)
                     bar(low: 0.4)
                        .animation(animation.speed(0.8), value: drawingHeight)
                     bar(low: 0.3)
                        .animation(animation.speed(0.3), value: drawingHeight)
                    
                    
                }   
                    .frame(width: 150)
                    .onAppear{
                        drawingHeight.toggle()
                    }
                    .padding(5)
                    .accessibilityHidden(true)
                
                
                Button(action: {
                    
                    timeRemaining=0
                    musicRecording.stopRecording()
                    fetchLastRecording(name: ("New Recording"), color: .black)
                    
                    self.showingSheet.toggle()
                    
                    print("recorded array \(records)")
                    
                }, label: {
                    ZStack {
                                                    Circle()
                                                        .stroke(Color.gray, lineWidth: 3)
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame (width: 65)
                                                        .foregroundStyle(Color.gray)
                    
                                                    Rectangle()
                                                        .cornerRadius(3.0)
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame (width: 25)
                                                        .foregroundStyle(Color.red)
                                                }
                }) .accessibilityLabel("Stop Recording Button")
                
            }
            
        } .presentationDetents([.height(250),.height(500)])
        
    }
}

struct RecordingView: View {
    

    @State private var showingSheet = false
    @State private var recordedDatas = RecordingDatas()
    @State private  var record = false
    @State var records: [recording] = prova.sounds
    @State private var play = false
    
    
    @State private var musicRecording = VoiceViewModel ()
    @State private var timeRemaining = 0.00
    
    


    func fetchLastRecording(name: String, color: Color){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
        
        //sort
        let sortedContents = directoryContents.sorted { url1, url2 in
                return url1.lastPathComponent < url2.lastPathComponent
            }
        
        let i = sortedContents.last
        records.append(recording(name : name, fileURL: i!))
        
    }
    
    
    func deleteRecordingFile(sounds: recording) {
        let fileManager = FileManager.default

        do {
            print("fileURL da eliminare: \(sounds.fileURL)")
            try fileManager.removeItem(at: sounds.fileURL)
            records.removeAll { $0.id == sounds.id }
            print("file deleted")
        } catch {
            print("Error deleting file: \(error)")
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let directoryContents = try! FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            print("directoryContent: \(directoryContents)")
        }
    }
    
    func emptyDirectory(atPath directoryPath: URL) {
        let fileManager = FileManager.default
        
        do {
            let contents = try fileManager.contentsOfDirectory(at: directoryPath, includingPropertiesForKeys: nil, options: [])
            for item in contents {
                try fileManager.removeItem(at: item)
            }
        } catch {
            print("Error emptying directory: \(error)")
        }
    }
    
    
    var body: some View {
        
        
        if records.isEmpty {
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
                        .accessibilityHidden(true)
                    Text ("No Recordings")
                        .font(.title2)
                        .bold()
                    Text ("Voice memos you record will appear here.")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                    
                    Spacer()
                    
                    
                    ZStack {
                        Rectangle()
                            .frame(height: 130)
                            .foregroundStyle(Color.gray)
                            .opacity(0.1)
                            .ignoresSafeArea()
                        Button(action: {
                            
                            
                            self.showingSheet.toggle()
                            record.toggle()
                            
                            if (record == true) {
                                musicRecording.startRecording()
                            } else {
                                
                                musicRecording.audioRecorder.pause()

                            }
                            
                        }, label: {
                            ZStack { Circle()
                                    .stroke(Color.gray, lineWidth: 3)
                                    .aspectRatio(contentMode: .fit)
                                    .frame (width: 65)
                                    .foregroundStyle(Color.gray)
                                
                                Circle()
                                    .aspectRatio(contentMode: .fit)
                                    .frame (width: 55)
                                    .foregroundStyle(Color.red)
                            } .accessibilityLabel("Record")
                        })
                        .sheet(isPresented: $showingSheet) {
                            SheetView(record: $record, showingSheet: self.$showingSheet, records: $records, musicRecording: $musicRecording, timeRemaining: $timeRemaining)
                                
                        }
                        
                    }
                    
                    
                    
                }
                .ignoresSafeArea()
                .navigationTitle("All Recordings")
                
            }
        } else {
            
            NavigationStack {
                
                
                
                VStack {
                    
                    List { ForEach(records) {recordedSound in
                         
                        VStack {
                            
                            Text (recordedSound.name)
                                .bold()
                                .font(.title3)
                                .padding(.trailing, 200)
                            
                            
                            
                            HStack {
                                
                                Text ("15:32")
                                    .foregroundStyle(Color.gray)
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    .offset(x:-10,y:-10)
                                
                                Spacer()
                                
                                Button (action: {
                                    
                                    
                                }, label: {
                                    Image (systemName: "ellipsis.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundStyle(Color.blue)
                                        .frame(width: 25)
                                        .offset(x:10,y:-10)
                                })
                            }    .padding(.horizontal)
                            
                            
                            ZStack {
                                
                                Rectangle()
                                    .frame(width:340, height: 2)
                                    .foregroundStyle(Color.gray)
                                    .opacity(0.5)
                                    .cornerRadius(5)
                                
                                Circle()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:7)
                                    .foregroundStyle(Color.gray)
                                    .offset(x:-170)
                                
                            } .offset(y: 10)
                            
                            
                            HStack {
                                
                                
                                Button (action: {
                                    
                                    
                                }, label: {
                                    Image (systemName: "slider.horizontal.3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:22)
                                        .foregroundStyle(Color.blue)
                                        .offset(x:-50)
                                })
                                
                                Button (action: {
                                    
                                    
                                    
                                }, label: {
                                Image (systemName: "gobackward.15")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 23)
                                    .padding(.horizontal)
                                        })
                                Button(action: {
                                    
                                    recordedSound.isPlaying.toggle()
                                    play=recordedSound.isPlaying
                                    
                                    if(recordedSound.isPlaying==true){
                                        musicRecording.startPlaying(url: recordedSound.fileURL)
                                        
                                    }else{
                                        musicRecording.stopPlaying(url: recordedSound.fileURL)
                                    }
                                    
                                }, label: {
                                    Image (systemName: recordedSound.isPlaying ? "pause.fill" : "play.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:27)
                                        .padding(.horizontal)
                                })
                                
                                Button (action: {
                                    
                                    
                                }, label: {
                                    Image (systemName: "goforward.15")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 23)
                                        .padding(.horizontal)
                                })
                                
                                
                                Button(action: {
                                    
                                   
                                    
                                }, label: {
                                    Image (systemName: "trash")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 22)
                                        .foregroundStyle(Color.blue)
                                        .offset(x: 50)
                                        
                                })
                                
                            }
                                .padding(.top, 40)
                            
                            
                        
                            
                        } .swipeActions {
                            
                            Button(role: .destructive) {
                                print("Deleting conversation")
                                deleteRecordingFile(sounds: recordedSound)
//                                recordedDatas.sounds.remove(at: )
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Move to Folder", systemImage: "folder.fill")
                            }
                            .tint(.blue)
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("More Actions", systemImage: "ellipsis")
                            }
                        }
                        
                        
                    }
                    }.listStyle(.plain)
                    
                    
                    VStack {
                        
                        
                        
                        ZStack {
                            Rectangle()
                                .frame(height: 130)
                                .foregroundStyle(Color.gray)
                                .opacity(0.1)
                                .ignoresSafeArea()
                            Button(action: {
                                
                                
                          
                                self.showingSheet.toggle()
                                record.toggle()
                                
                                if (record == true) {
                                    musicRecording.startRecording()
                                } else {
    //                                timeRemaining=0
                                    musicRecording.audioRecorder.pause()
    //                                showPopUp=true
                                }
                                
                            }, label: {
                                ZStack { 
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
                            })
                            .sheet(isPresented: $showingSheet) {
                                SheetView(record: $record, showingSheet: self.$showingSheet, records: $records, musicRecording: $musicRecording, timeRemaining: $timeRemaining)
                            }
                            
                        } .offset(y:40)
                        
                        
                        
                    }
                    .ignoresSafeArea()
                    .navigationTitle("All Recordings")
                    .navigationBarItems(trailing: EditButton())
                    
                }
            }
            }
        }
     }



#Preview {
    RecordingView()
}
