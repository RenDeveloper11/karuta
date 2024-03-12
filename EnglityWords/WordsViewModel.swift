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
    ] {
        didSet {
            saveWordsListToUserDefaults()
        }
    }
    @Published var profile: [Profile] = [
        Profile(username: "")
    ] {
        didSet {
            saveProfileToUserDefaults()
        }
    }
    @Published var shuffledWordsList: [WordsList] = []
    @Published var shuffle7Word: [WordsList] = []
    @Published var eng7Word: [WordsList] = []
    @Published var jp7Word: [WordsList] = []
    
    func startShuffle() {
        shuffledWordsList = wordsList.shuffled() // wordsListをシャッフルする
        shuffle7Word = Array(shuffledWordsList.prefix(7)) // シャッフルされたwordsListから7つ取り出す
        eng7Word = shuffle7Word.shuffled() // 英語列用にさらにシャッフル
        jp7Word = shuffle7Word.shuffled() // 日本語列用にさらにシャッフル
        shuffledWordsList.removeFirst(7)
    }
    
    func timeFormat(time: Double) -> String {
        return String(format: "%.1f", time)
    }
    
    // ↓wordsListが変更されるたびにUserDefaultsに保存する処理↓
    private let userDefaultsKey = "yourUserDefaultsKey"
    
    init() {
        loadWordsListFromUserDefaults()
        loadProfileFromUserDefaults()
    }
    
    private func saveWordsListToUserDefaults() {
        do {
            let data = try JSONEncoder().encode(wordsList)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Failed to encode and save wordsList: \(error)")
        }
    }
    
    private func loadWordsListFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey) {
            do {
                wordsList = try JSONDecoder().decode([WordsList].self, from: data)
            } catch {
                print("Failed to decode wordsList from UserDefaults: \(error)")
            }
        }
    }
    
    // ↓profileが変更されるたびにUserDefaultsに保存する処理↓
    private let profileUserDefaultsKey = "profileUserDefaultsKey"
    
    private func saveProfileToUserDefaults() {
        do {
            let data = try JSONEncoder().encode(profile)
            UserDefaults.standard.set(data, forKey: profileUserDefaultsKey)
        } catch {
            print("Failed to encode and save profile: \(error)")
        }
    }
    
    private func loadProfileFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: profileUserDefaultsKey) {
            do {
                profile = try JSONDecoder().decode([Profile].self, from: data)
            } catch {
                print("Failed to decode profile from UserDefaults: \(error)")
            }
        }
    }
    
}
