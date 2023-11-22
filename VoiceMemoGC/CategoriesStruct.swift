//
//  CategoriesStruct.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 14/11/23.
//

import Foundation
import SwiftUI

struct recordCategory: Identifiable{
    var id: UUID = UUID()
    var name: String = "category name"
    var image: String = "folder"
    var color: Color = .blue
    var number: String = "0"
    
}

@Observable class recording: Identifiable {
    
    var id: UUID = UUID ()
    var name: String = "New Recording"
    var fileURL: URL
    var isPlaying : Bool = false
    
    
    init(name: String, fileURL: URL) {
        
        self.name = name
        self.fileURL = fileURL
        
    }
   
}


