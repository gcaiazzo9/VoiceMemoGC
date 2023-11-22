//
//  PopUpView.swift
//  VoiceMemoGC
//
//  Created by Giorgio Caiazzo on 16/11/23.
//

import SwiftUI

struct PopUpView: View {
    @State private var showingAlert = false
    @State private var name = ""
    @State private var tags = ""
//    @Environment(Datas.self) private var datas


    var body: some View {
        Button("Enter name") {
            showingAlert.toggle()
        }
        .alert("New Folder", isPresented: $showingAlert) {
            TextField("Name", text: $name)
            Button("Cancel", role: .cancel, action: submit)
            Button("Save", role: .destructive, action: submit)
        }
    }

    func submit() {
        print("You entered \(name)")
    }
}

#Preview {
    PopUpView()
}

