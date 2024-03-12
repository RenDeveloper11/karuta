//
//  Karuta.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/18.
//　

import SwiftUI
import AVFoundation

struct Karuta: View {
    @EnvironmentObject var wordViewModel: WordsViewModel
    @State private var wordList: WordsList? = nil
    @State private var screenNo = 0 // 画面番号
    @State private var selectedEngIndex: Int? = nil // 選択している英語
    @State private var selectedJpIndex: Int? = nil // 選択している日本語
    @State private var correctCount = 0 // 正解数
    
    var body: some View {
        if screenNo == 0 {
            VStack {
                Button(action: {
                    wordViewModel.startShuffle()
                    screenNo = 1
                }, label: {
                    Text("スタート")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                })
                Button(action: {
                    let appDomain = Bundle.main.bundleIdentifier
                    UserDefaults.standard.removePersistentDomain(forName: appDomain!)
                }, label: {
                    Text("削除")
                        .padding(.top, 100)
                })
            }
        } else if screenNo == 1 {
            HStack {
                Spacer()
                VStack {
                    ForEach(wordViewModel.eng7Word, id: \.wordNo) { word in
                        Button(action: {
                            if selectedEngIndex == nil {
                                selectedEngIndex = word.wordNo
                                if selectedEngIndex == selectedJpIndex { // 正解したら
                                    correctCount += 1 // 正解数インクリメント
                                    wordViewModel.eng7Word.removeAll() { $0.english == word.english }
                                    wordViewModel.jp7Word.removeAll() { $0.japanese == word.japanese }
                                    selectedEngIndex = nil
                                    selectedJpIndex = nil
                                    
                                    if wordViewModel.eng7Word.isEmpty && wordViewModel.shuffledWordsList.count >= 7 {
                                        wordViewModel.shuffle7Word = Array(wordViewModel.shuffledWordsList.prefix(7))
                                        wordViewModel.eng7Word = wordViewModel.shuffle7Word.shuffled()
                                        wordViewModel.jp7Word = wordViewModel.shuffle7Word.shuffled()
                                        wordViewModel.shuffledWordsList.removeFirst(7)
                                    } else if wordViewModel.eng7Word.isEmpty && wordViewModel.shuffledWordsList.count <= 7 {
                                        screenNo = 2
                                    }
                                }
                            } else if selectedEngIndex == word.wordNo {
                                selectedEngIndex = nil
                            } else {
                                selectedEngIndex = word.wordNo
                            }
                            if selectedJpIndex != nil && selectedEngIndex != selectedJpIndex && selectedEngIndex != nil { // 不正解だったら
                                wordViewModel.wordsList[selectedJpIndex! - 1].wrongCount += 1
                                selectedEngIndex = nil
                                selectedJpIndex = nil
                                screenNo = 2 // 不正解で遷移
                            }
                        
                        }, label: {
                            Text(word.english)
                                .foregroundStyle(self.selectedEngIndex == word.wordNo ? Color.blue : Color.gray)
                                .frame(minWidth: 150, minHeight: 50)
                                .background(self.selectedEngIndex == word.wordNo ? Color(red: 0.39, green: 0.82, blue: 1.0, opacity: 1.0) : Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                                .padding(.vertical, 10)
                        })
                        .id(UUID())
                    }
                }
                Spacer()
                VStack {
                    ForEach(wordViewModel.jp7Word, id: \.wordNo) { word in
                        Button(action: {
                            if selectedJpIndex == nil {
                                selectedJpIndex = word.wordNo
                                if selectedEngIndex == selectedJpIndex { // 正解したら
                                    correctCount += 1
                                    wordViewModel.jp7Word.removeAll() { $0.japanese == word.japanese }
                                    wordViewModel.eng7Word.removeAll() { $0.english == word.english }
                                    selectedEngIndex = nil
                                    selectedJpIndex = nil
                                    
                                    if wordViewModel.eng7Word.isEmpty && wordViewModel.shuffledWordsList.count >= 7 {
                                        wordViewModel.shuffle7Word = Array(wordViewModel.shuffledWordsList.prefix(7))
                                        wordViewModel.eng7Word = wordViewModel.shuffle7Word.shuffled()
                                        wordViewModel.jp7Word = wordViewModel.shuffle7Word.shuffled()
                                        wordViewModel.shuffledWordsList.removeFirst(7)
                                    } else if wordViewModel.eng7Word.isEmpty && wordViewModel.shuffledWordsList.count <= 7 {
                                        screenNo = 2
                                    }
                                }
                            } else if selectedJpIndex == word.wordNo {
                                selectedJpIndex = nil
                            } else {
                                selectedJpIndex = word.wordNo
                            }
                            if selectedEngIndex != nil && selectedEngIndex != selectedJpIndex && selectedJpIndex != nil { // 不正解だったら
                                wordViewModel.wordsList[selectedEngIndex! - 1].wrongCount += 1
                                selectedEngIndex = nil
                                selectedJpIndex = nil
                                screenNo = 2 // 不正解で画面遷移
                            }
                            
                        }, label: {
                            Text(word.japanese)
                                .foregroundStyle(self.selectedJpIndex == word.wordNo ? Color.blue : Color.gray)
                                .frame(minWidth: 150, minHeight: 50)
                                .background(self.selectedJpIndex == word.wordNo ? Color(red: 0.39, green: 0.82, blue: 1.0, opacity: 1.0) : Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                                .padding(.vertical, 10)
                        })
                        .id(UUID())
                    }
                }
                Spacer()
            }
        } else {
            VStack {
                Text("残念😭")
                    .padding(.bottom, 10)
                Text("\(correctCount) 問正解したよ!")
                    .padding(.bottom, 30)
                Button {
                    screenNo = 0
                } label: {
                    Text("タイトルに戻る")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }

            }
            .font(.title)
            .bold()
        }
    }
    
}

#Preview {
    Karuta()
        .environmentObject(WordsViewModel())
}
