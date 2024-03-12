//
//  EditProfile.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/03/11.
//

import SwiftUI
import Combine

struct EditProfile: View {
    @EnvironmentObject var wordViewModel: WordsViewModel
    
    var body: some View {
        TextField("入力", text: Binding(
            get: { self.wordViewModel.profile[0].username },
            set: { newValue in
                if newValue.count <= 6 {
                    self.wordViewModel.profile[0].username = newValue
                }
            }
        ))
            .textFieldStyle(.roundedBorder)
            .padding()
        
    }
}

#Preview {
    EditProfile()
        .environmentObject(WordsViewModel())
}
