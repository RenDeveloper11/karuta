//
//  WordsList.swift
//  EnglityWords
//
//  Created by 酒井蓮 on 2024/02/18.
//

import SwiftUI
import Foundation
import CoreLocation

struct WordsList: Identifiable, Codable {
    var id = UUID()
    var wordNo: Int
    var english: String
    var japanese: String
    var isWrong: Bool = false
    var tags: [String]?
    var wrongCount: Int = 0
}

struct Profile: Codable {
    var username: String
    var prefersNotifications = true
    var userLV:Int = 0
    var LoginDay:Int = 0
}
