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
    var image: String = "category image"
    var color: Color = .blue
    
}

struct recording : Identifiable {
    
    var id: UUID = UUID ()
    var name: String = "recording name"
    var image: String = "recording image"
}
