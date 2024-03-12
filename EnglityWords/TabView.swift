//
//  TabView.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/03/11.
//

import SwiftUI

struct TabView: View {
    @State var selection = 1
    
    var body: some View {
        TabView {
            TabView2()
                Text("a")
                .tabItem {
                    VStack {
                        Text("One")
                        Image(systemName: "star")
                    }
                }
                .tag("e")
        }
    }
}

struct TabView2: View {
    @State var selection = 1
    
    var body: some View {
        VStack {
            Text("a")
        }
    }
}

#Preview {
    TabView()
        .environmentObject(WordsViewModel())
}
