//
//  CarsAppApp.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 08.05.2022.
//

import SwiftUI

@main
struct CarsAppApp: App {
    
    @StateObject private var isLaunchedBefore = UserData()
    @StateObject private var game = UserData()
    @StateObject private var gallery = UserData()
    @StateObject private var unlockedCars = UserData()
    @StateObject private var tempCars = UserData()
    @StateObject private var score = UserData()
    @StateObject private var maxScore = UserData()
    
    var body: some Scene {
        WindowGroup {
            firstLaunchLogic()
                .environmentObject(isLaunchedBefore)
                .environmentObject(game)
                .environmentObject(gallery)
                .environmentObject(unlockedCars)
                .environmentObject(tempCars)
                .environmentObject(score)
                .environmentObject(maxScore)
        }
    }
}
