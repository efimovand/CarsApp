//
//  UserData.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 10.05.2022.
//

import SwiftUI
import Foundation

class UserData: ObservableObject {
    @Published var isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
    @Published var game: Bool = false
    @Published var library: Bool = false
    @Published var unlockedCars: [String] = UserDefaults.standard.stringArray(forKey: "unlockedCars") ?? [] // string array of unlocked cars
    @Published var tempCars: [String] = [] // string temporary array for saving new cars during the game
    @Published var score: Int = 1
    @Published var maxScore = UserDefaults.standard.integer(forKey: "maxScore")
    @Published var loseAlertCollection: Bool = false // loseAlert activation for collections
    @Published var loseBlurRadius: CGFloat = 0
    @Published var extraLives = UserDefaults.standard.integer(forKey: "extraLives")
}
