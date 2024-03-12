//
//  ContentView.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WordsViewModel())
}
