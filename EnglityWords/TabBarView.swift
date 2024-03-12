//
//  TabBarView.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/03/11.
//

import SwiftUI

struct TabBarView: View {
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            ProfileView()
                .tabItem {
                    Label("プロフィール", systemImage: "person")
                }
                .tag(1)
            Karuta()
                .tabItem {
                    Label("カルタ", systemImage: "textformat.size.smaller")
                }
                .tag(2)
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(WordsViewModel())
}
