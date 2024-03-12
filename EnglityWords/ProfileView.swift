//
//  ProfileView.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/03/11.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var wordViewModel: WordsViewModel
    @State private var wordList: WordsList? = nil
    @State private var isShowEditProfile = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    HStack {
                        ImageView()
                        Spacer()
                        Text(wordViewModel.profile[0].username)
                            .bold()
                            .font(.title)
                        Spacer()
                        Text("Lv.\(wordViewModel.profile[0].userLV)")
                            .padding(.trailing, 15)
                            .bold()
                            .font(.title3)
                    }
                    HStack {
                        Text("ログイン")
                        Spacer()
                        Text("\(wordViewModel.profile[0].LoginDay) 日目")
                        Spacer()
                    }
                    ForEach(wordViewModel.wordsList.sorted(by: { $0.wrongCount > $1.wrongCount }), id: \.id) { word in
                        HStack {
                            Text(word.english)
                            Spacer()
                            Text("\(word.wrongCount) 回ミス")
                        }
                    }
                }
                .navigationTitle("プロフィール")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowEditProfile.toggle()
                        }, label: {
                            Image(systemName: "person.crop.circle")
                        })
                        .sheet(isPresented: $isShowEditProfile) {
                            EditProfile()
                        }
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    var body: some View {
        VStack {
            Image("komasan")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 5)
                .padding(.top, 3)
            
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(WordsViewModel())
}
