//
//  WordsViewModel.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/18.
//

import SwiftUI
import Foundation

class WordsViewModel: ObservableObject {
    @Published var wordsList: [WordsList] = [
        WordsList(wordNo: 1, english: "hello", japanese: "こんにちは", tags: ["名詞"]),
        WordsList(wordNo: 2, english: "bird", japanese: "鳥", tags: ["名詞"]),
        WordsList(wordNo: 3, english: "soccer", japanese: "サッカー", tags: ["名詞"]),
        WordsList(wordNo: 4, english: "climb", japanese: "登る", tags: ["動詞"]),
        WordsList(wordNo: 5, english: "hand", japanese: "手", tags: ["名詞"]),
        WordsList(wordNo: 6, english: "just", japanese: "ちょうど・単に", tags: ["副詞"]),
        WordsList(wordNo: 7, english: "really", japanese: "本当に", tags: ["副詞"]),
        WordsList(wordNo: 8, english: "never", japanese: "決してない", tags: ["副詞"]),
        WordsList(wordNo: 9, english: "well", japanese: "良く・確かに", tags: ["副詞"]),
        WordsList(wordNo: 10, english: "very", japanese: "非常に", tags: ["副詞"]),
        WordsList(wordNo: 11, english: "maybe", japanese: "おそらく", tags: ["副詞"]),
        WordsList(wordNo: 12, english: "only", japanese: "ほんの・結局は", tags: ["副詞"]),
        WordsList(wordNo: 13, english: "ever", japanese: "これまでに", tags: ["副詞"]),
        WordsList(wordNo: 14, english: "always", japanese: "いつも", tags: ["副詞"]),
        WordsList(wordNo: 15, english: "actually", japanese: "実際は", tags: ["副詞"]),
    ]
    @Published var shuffledWordsList: [WordsList] = []
    @Published var shuffle3Word: [WordsList] = []
    @Published var eng3Word: [WordsList] = []
    @Published var jp3Word: [WordsList] = []
    
    func startShuffle() {
        shuffledWordsList = wordsList.shuffled()
        shuffle3Word = Array(shuffledWordsList.prefix(7))
        eng3Word = shuffle3Word.shuffled()
        jp3Word = shuffle3Word.shuffled()
        shuffledWordsList.removeFirst(7)
    }
    
    func timeFormat(time: Double) -> String {
        return String(format: "%.1f", time)
    }
    
}
