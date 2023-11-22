//
//  RecordCardView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 16/11/23.
//

import SwiftUI

struct RecordCardView: View {
    
    var recordedDatas : Recording
    
    var body: some View {
        
       
        ZStack {
            //            Rectangle()
            //                .stroke(Color.gray)
            //                .fill(Color.white)
            //                .frame(width: .infinity, height: 200)
            
            
                VStack {
                    
                    Text (recordedDatas.name)
                        .bold()
                        .font(.title3)
                        .padding(.trailing, 210)
                    
                    
                    
                    HStack {
                        
                        Text ("15:32")
                            .foregroundStyle(Color.gray)
                            .font(.headline)
                            .fontWeight(.regular)
                            .offset(x:-10)
                        
                        Spacer()
                        
                        Image (systemName: "ellipsis.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(Color.blue)
                            .frame(width: 25)
                            .offset(x:10)
                        
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
                        
                    } .offset(y: 50)
                    
                    
                    HStack {
                        
                        Image (systemName: "slider.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:22)
                            .foregroundStyle(Color.blue)
                            .offset(x:-50)
                        
                        
                        
                        Image (systemName: "gobackward.15")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23)
                            .padding(.horizontal)
                        
                        Image (systemName: "play.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:27)
                            .padding(.horizontal)
                        
                        Image (systemName: "goforward.15")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23)
                            .padding(.horizontal)
                        
                        
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
                        .padding(.top, 100)
                    
                    
                
                    
                }
                
                
            }
        
    }
}

#Preview {
    RecordCardView(recordedDatas: Recording (name: "Record n01"))
}
