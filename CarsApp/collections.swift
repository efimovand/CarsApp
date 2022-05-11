//
//  collections.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 10.05.2022.
//

import SwiftUI

struct collection_rx7: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("rx7")
    @State var cars = ["sa22c", "fc3s", "fd3s"]
    @State var correctAnswer = Int.random(in: 0..<3)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
            
            // Buttons
            VStack(spacing: 50){
                
                ForEach(0..<3) { number in
                    
                    Button(action: {
                        answeredCollection(number)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 200, height: 150)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
            
            // Question
            Text("Guess the '\(cars[correctAnswer])'")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 20))
                .offset(y: UIScreen.screenHeight * 0.4 + 5)
            
        }.ignoresSafeArea()
        
    }
    
    // checking is tapped answer right
    func answeredCollection(_ tag: Int) {
        
        if tag == correctAnswer {
            
            correctAnswer = Int.random(in: 0..<3)
            
            data.score += 1
            
            if !(data.unlockedCars.contains(cars[tag] as String)) {
                data.tempCars.append(cars[tag] as String)
            }
            
        }
        else {
            data.loseAlertCollection = true
        }
        
    }
    
}

struct collection_mx5: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("mx5")
    @State var cars = ["na", "nb", "nc", "nd"]
    @State var correctAnswer = Int.random(in: 0..<4)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                .ignoresSafeArea()
            
            // Buttons
            VStack(spacing: 40){
                
                HStack(spacing: 50){
                    
                    Button(action: {
                        answeredCollection(0)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 150, height: 150)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(1)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 150, height: 150)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 50){
                    
                    Button(action: {
                        answeredCollection(2)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 150, height: 150)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(3)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 150, height: 150)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
            
            // Question
            Text("Guess the '\(cars[correctAnswer])'")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 19))
                .offset(y: UIScreen.screenHeight * 0.4 + 5)
            
        }.ignoresSafeArea()
        
    }
    
    // checking is tapped answer right
    func answeredCollection(_ tag: Int) {
        
        if tag == correctAnswer {
            
            correctAnswer = Int.random(in: 0..<4)
            
            data.score += 1
            
            if !(data.unlockedCars.contains(cars[tag] as String)) {
                data.tempCars.append(cars[tag] as String)
            }
            
        }
        else {
            data.loseAlertCollection = true
        }
        
    }
    
}


struct collections_Previews: PreviewProvider {
    static var previews: some View {
        collection_mx5()
            .environmentObject(UserData())
    }
}
