//
//  WordsList.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/18.
//

import SwiftUI
import Foundation

struct WordsList: Identifiable, Codable {
    var id = UUID()
    var wordNo: Int
    var english: String
    var japanese: String
    var isWrong: Bool = false
    var tags: [String]?
    var wrongCount: Int = 0
}
