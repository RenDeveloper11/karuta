//
//  EnglityWordsApp.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/12.
//

import SwiftUI

@main
struct EnglityWordsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WordsViewModel())
        }
    }
}
