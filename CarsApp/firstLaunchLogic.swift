//
//  firstLaunchLogic.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 09.05.2022.
//

import SwiftUI
import Foundation

struct firstLaunchLogic: View {
    
    @AppStorage("isLaunchedBefore") var isLaunchedBefore: Bool = false
    
    var body: some View {
        
        if isLaunchedBefore {
            menuView()
        }
        else {
            menuView()
                .task {
                    UserDefaults.standard.set([], forKey: "unlockedCars")
                    UserDefaults.standard.set(0, forKey: "maxScore")
                    UserDefaults.standard.set(0, forKey: "extraLives")
                    UserDefaults.standard.set(true, forKey: "isLaunchedBefore")
                }
        }
        
    }
    
}
