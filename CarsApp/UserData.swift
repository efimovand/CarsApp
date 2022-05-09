//
//  UserData.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 10.05.2022.
//

import Foundation

class UserData: ObservableObject {
    @Published var isLaunchedBefore = UserDefaults.standard.bool(forKey: "isLaunchedBefore")
    @Published var game: Bool = false
    @Published var gallery: Bool = false
    @Published var unlockedCars: [String] = UserDefaults.standard.stringArray(forKey: "unlockedCars") ?? [] // string array of unlocked cars
    @Published var tempCars: [String] = [] // string temporary array for saving new cars during the game
    @Published var score: Int = 1
    @Published var maxScore = UserDefaults.standard.integer(forKey: "maxScore")
}
