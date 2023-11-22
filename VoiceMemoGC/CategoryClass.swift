//
//  CategoryClass.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 14/11/23.
//

import Foundation
import SwiftUI

@Observable class Categories{
    
    var categoryArray: [recordCategory] = [
    
        recordCategory(name: "All Recordings", image: "waveform", number: "2"), recordCategory(name: "Recently Deleted", image: "trash", number: "0")
    
    ]
    
    var personalCategoryArray: [recordCategory] = [
    
   
    
    ]
}
