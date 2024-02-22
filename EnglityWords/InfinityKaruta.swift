//
//  InfinityKaruta.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/15.
//

import SwiftUI

//struct InfinityKaruta: View {
//    @State private var wordsList: [[String]] = [["hello", "こんにちは"], ["good morning", "おはよう"], ["book", "本"], ["hand", "手"], ["face", "顔"], ["head", "頭"], ["eye", "目"], ["nose", "鼻"], ["actually", "実際に"], ["again", "また"], ["already", "既に"], ["alright", "大丈夫"], ["always", "いつも"], ["angry", "怒る"], ["animal", "動物"], ["another", "別の"], ["anything", "何か"], ["beginner", "初心者"], ["bird", "鳥"]]
//    @State private var shuffledWordsList: [[String]] = [[]]
//    @State private var shuffledEng: [[String]] = [[]]
//    @State private var shuffledEng2: [[String]] = [[]]
//    @State private var shuffledJp: [[String]] = [[]]
//    @State private var shuffledJp2: [[String]] = [[]]
//    @State private var selectEngNo = 10001
//    @State private var selectJpNo = 10000
//    @State private var shufflebutton = false
//    @State private var pattern = "[a-zA-Z]"
//    @State private var selectedEngIndex: Int? = nil
//    @State private var selectedJpIndex: Int? = nil
//    @State private var tappedIndexEng: Int? // 外部で宣言された変数
//    @State private var tappedIndexJp: Int? // 外部で宣言された変数
//    @State private var correctEng = false
//    @State private var correctJp = false
//    @State private var isShowStartButton = true
//    @State private var xInt: Int?
//    @State private var xIndex: Int?
//    @State private var yInt: Int?
//    @State private var yIndex: Int?
//    
//    var body: some View {
//        VStack {
//            if isShowStartButton {
//                Button(action: {
//                    randomInt()
//                    shufflebutton.toggle()
//                    isShowStartButton = false
//                }, label: {
//                    Text("スタート")
//                        .padding()
//                })
//            }
//            if shufflebutton {
//                HStack {
//                    VStack {
//                        ForEach(0..<shuffledEng2.count, id: \.self) { index in
//                            Button(action: {
//                                correctEng = false
//                                tappedIndexEng = index
//                                selectEngNo = wordsList.firstIndex(where: { $0.first == shuffledEng2[index][0]})!
//                                
//                                xInt = wordsList.firstIndex(where: { $0.contains(shuffledEng2[index][0]) })
//                                xIndex = wordsList[xInt ?? 1].firstIndex(of: shuffledEng2[index][0])
//                                        
//                                if selectJpNo == selectEngNo && selectedJpIndex != nil {
//                                    if !shuffledWordsList.isEmpty{
//                                        shuffledWordsList.remove(at: 0)
//                                        shuffledEng2.remove(at: index)
//                                        shuffledJp2.remove(at: tappedIndexJp ?? 1)
//                                        shuffledEng2.insert(shuffledWordsList[0], at: Int.random(in: 0..<5))
//                                        shuffledJp2.insert(shuffledWordsList[0], at: Int.random(in: 0..<5))
//                                        correctEng = true
//                                    }
//                                } else if selectJpNo == selectEngNo && xIndex != yIndex {
//                                    print("不正解")
//                                }
//                                
//                                if selectedEngIndex == index {
//                                    // ボタンが選択されている状態で再度タップされた場合
//                                    selectedEngIndex = nil
//                                } else if correctEng == true {
//                                    selectedEngIndex = nil
//                                    selectedJpIndex = nil
//                                } else {
//                                    selectedEngIndex = index
//                                }
//                                
//                            }, label: {
//                                Text(shuffledEng2[index][0])
//                                    .foregroundStyle(self.selectedEngIndex == index ? Color.blue : Color.gray)
//                            })
//                            .id(UUID())
//                        }
//                    }
//                    VStack {
//                        ForEach(0..<shuffledJp2.count, id: \.self) { index in
//                            Button(action: {
//                                correctJp = false
//                                tappedIndexJp = index
//                                selectJpNo = wordsList.firstIndex(where: { $0.last == shuffledJp2[index][1]})!
//                                
//                                yInt = wordsList.firstIndex(where: { $0.contains(shuffledJp2[index][0]) })
//                                yIndex = wordsList[yInt ?? 1].firstIndex(of: shuffledJp2[index][0])
//                                
//                                if selectJpNo == selectEngNo && selectedEngIndex != nil {
//                                    if !shuffledWordsList.isEmpty{
//                                        shuffledEng2.append(shuffledWordsList[0])
//                                        shuffledJp2.append(shuffledWordsList[0])
//                                        shuffledWordsList.remove(at: 0)
//                                        shuffledJp2.remove(at: index)
//                                        shuffledEng2.remove(at: tappedIndexEng ?? 1)
//                                        correctJp = true
//                                    }
//                                }
//                                
//                                if selectedJpIndex == index {
//                                    // ボタンが選択されている状態で再度タップされた場合
//                                    selectedJpIndex = nil
//                                } else if correctJp == true {
//                                    selectedJpIndex = nil
//                                    selectedEngIndex = nil
//                                } else {
//                                    selectedJpIndex = index
//                                }
//                                
//                            }, label: {
//                                Text(shuffledJp2[index][1])
//                                    .foregroundStyle(self.selectedJpIndex == index ? Color.blue : Color.gray)
//                            })
//                            .id(UUID())
//                        }
//                    }
//                }
//            }
//        }
//    }
//

//#Preview {
//    InfinityKaruta()
//}

// .frame(minWidth: 150, minHeight: 50)
//                            .background(Color(red: 0.39, green: 0.82, blue: 1.0, opacity: 1.0))
//                            .cornerRadius(10)
//                            .font(.headline)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.blue, lineWidth: 2)
//                            )
//                            .padding(.vertical, 10)
