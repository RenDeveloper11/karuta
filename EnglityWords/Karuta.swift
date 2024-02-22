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
    @State private var screenNo = 0
    @State private var selectedEngIndex: Int? = nil
    @State private var selectedJpIndex: Int? = nil
    @State private var correctCount = 0
    
    var body: some View {
        if screenNo == 0 {
            Button(action: {
                wordViewModel.startShuffle()
                screenNo = 1
            }, label: {
                Text("スタート")
            })
        } else if screenNo == 1 {
            HStack {
                Spacer()
                VStack {
                    ForEach(wordViewModel.eng3Word, id: \.wordNo) { word in
                        Button(action: {
                            if selectedEngIndex == nil {
                                selectedEngIndex = word.wordNo
                                if selectedEngIndex == selectedJpIndex {
                                    print("正解")
                                    correctCount += 1
                                    wordViewModel.eng3Word.removeAll() { $0.english == word.english }
                                    wordViewModel.jp3Word.removeAll() { $0.japanese == word.japanese }
                                    selectedEngIndex = nil
                                    selectedJpIndex = nil
                                    
                                    if wordViewModel.eng3Word.isEmpty && wordViewModel.shuffledWordsList.count >= 7 {
                                        wordViewModel.shuffle3Word = Array(wordViewModel.shuffledWordsList.prefix(7))
                                        wordViewModel.eng3Word = wordViewModel.shuffle3Word.shuffled()
                                        wordViewModel.jp3Word = wordViewModel.shuffle3Word.shuffled()
                                        wordViewModel.shuffledWordsList.removeFirst(7)
                                    } else if wordViewModel.eng3Word.isEmpty && wordViewModel.shuffledWordsList.count <= 7 {
                                        screenNo = 2
                                    }
                                }
                            } else if selectedEngIndex == word.wordNo {
                                selectedEngIndex = nil
                            } else {
                                selectedEngIndex = word.wordNo
                            }
                            if selectedJpIndex != nil && selectedEngIndex != selectedJpIndex && selectedEngIndex != nil {
                                print("不正解")
                                selectedEngIndex = nil
                                selectedJpIndex = nil
                                screenNo = 2
                            }
                        
                        }, label: {
                            Text(word.english)
                                .foregroundStyle(self.selectedEngIndex == word.wordNo ? Color.blue : Color.gray)
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
                    ForEach(wordViewModel.jp3Word, id: \.wordNo) { word in
                        Button(action: {
                            if selectedJpIndex == nil {
                                selectedJpIndex = word.wordNo
                                if selectedEngIndex == selectedJpIndex {
                                    print("正解")
                                    correctCount += 1
                                    wordViewModel.jp3Word.removeAll() { $0.japanese == word.japanese }
                                    wordViewModel.eng3Word.removeAll() { $0.english == word.english }
                                    selectedEngIndex = nil
                                    selectedJpIndex = nil
                                    
                                    if wordViewModel.eng3Word.isEmpty && wordViewModel.shuffledWordsList.count >= 7 {
                                        wordViewModel.shuffle3Word = Array(wordViewModel.shuffledWordsList.prefix(7))
                                        wordViewModel.eng3Word = wordViewModel.shuffle3Word.shuffled()
                                        wordViewModel.jp3Word = wordViewModel.shuffle3Word.shuffled()
                                        wordViewModel.shuffledWordsList.removeFirst(7)
                                    } else if wordViewModel.eng3Word.isEmpty && wordViewModel.shuffledWordsList.count <= 7 {
                                        screenNo = 2
                                    }
                                }
                            } else if selectedJpIndex == word.wordNo {
                                selectedJpIndex = nil
                            } else {
                                selectedJpIndex = word.wordNo
                            }
                            if selectedEngIndex != nil && selectedEngIndex != selectedJpIndex && selectedJpIndex != nil {
                                print("不正解")
                                selectedEngIndex = nil
                                selectedJpIndex = nil
                                screenNo = 2
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
                Text("ゲームクリア!")
                Text("\(correctCount) 問正解したよ!")
                Button {
                    screenNo = 0
                } label: {
                    Text("タイトルに戻る")
                }

            }
        }
    }
    
}

#Preview {
    Karuta()
        .environmentObject(WordsViewModel())
}
