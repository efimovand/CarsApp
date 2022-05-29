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
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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

struct collection_jimny: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("jimny")
    @State var cars = ["1970", "1981", "1998", "2018"]
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
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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

struct collection_gtr: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("gtr")
    @State var cars = ["kpgc10", "kpgc110", "r32", "r33", "r34", "r35"]
    @State var correctAnswer = Int.random(in: 0..<6)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                .ignoresSafeArea()
            
            // Buttons
            VStack(spacing: 50){
                
                HStack(spacing: 75){
                    
                    Button(action: {
                        answeredCollection(0)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(1)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 75){
                    
                    Button(action: {
                        answeredCollection(2)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(3)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 75){
                    
                    Button(action: {
                        answeredCollection(4)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(5)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 140, height: 120)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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
            
            correctAnswer = Int.random(in: 0..<6)
            
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

struct collection_m3: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("m3")
    @State var cars = ["e30", "e36", "e46", "e92", "f80", "g80"]
    @State var correctAnswer = Int.random(in: 0..<6)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                .ignoresSafeArea()
            
            // Buttons
            VStack(spacing: 50){
                
                HStack(spacing: 70){
                    
                    Button(action: {
                        answeredCollection(0)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(1)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 70){
                    
                    Button(action: {
                        answeredCollection(2)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(3)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 70){
                    
                    Button(action: {
                        answeredCollection(4)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(5)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 125, height: 100)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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
            
            correctAnswer = Int.random(in: 0..<6)
            
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

struct collection_gti: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("gti")
    @State var cars = ["mk.1", "mk.2", "mk.3", "mk.4", "mk.5", "mk.6", "mk.7", "mk.8"]
    @State var correctAnswer = Int.random(in: 0..<8)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                .ignoresSafeArea()
            
            // Buttons
            VStack(spacing: 45){
                
                HStack(spacing: 45){
                    
                    Button(action: {
                        answeredCollection(0)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(1)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(2)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 180){
                    
                    Button(action: {
                        answeredCollection(3)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(4)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                }
                
                HStack(spacing: 45){
                    
                    Button(action: {
                        answeredCollection(5)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(6)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(7)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 90, height: 80)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
                .padding(.bottom, 35)
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
            // Question
            Text("Guess the '\(cars[correctAnswer])'")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 19))
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color("darkOrange")).padding(-8))
                .offset(y: UIScreen.screenHeight * 0.4 + 5)
            
        }.ignoresSafeArea()
        
    }
    
    // checking is tapped answer right
    func answeredCollection(_ tag: Int) {
        
        if tag == correctAnswer {
            
            correctAnswer = Int.random(in: 0..<8)
            
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

struct collection_silvia: View {
    
    @EnvironmentObject var data: UserData
    
    @State var image: Image = Image("silvia")
    @State var cars = ["s10", "s12", "s13", "s14", "s15"]
    @State var correctAnswer = Int.random(in: 0..<5)
    
    var body: some View {
        
        ZStack{
            
            // Image
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                .ignoresSafeArea()
            
            // Buttons
            VStack(spacing: 55){
                    
                    Button(action: {
                        answeredCollection(0)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 120, height: 100)
                            .opacity(0)
                    }.padding(.leading, 10)
                
                HStack(spacing: 40){
                    
                    Button(action: {
                        answeredCollection(1)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 120, height: 100)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(2)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 120, height: 100)
                            .opacity(0)
                    }
                    
                }.padding(.leading, 10)
                
                HStack(spacing: 45){
                    
                    Button(action: {
                        answeredCollection(3)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 120, height: 100)
                            .opacity(0)
                    }
                    
                    Button(action: {
                        answeredCollection(4)
                    }) {
                        Rectangle()
                            .foregroundColor((Color.white))
                            .frame(width: 120, height: 100)
                            .opacity(0)
                    }
                    
                }
                
            }.padding(.top)
                .disabled(data.globalBlurRadius != 0 ? true : false)
            
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
            
            correctAnswer = Int.random(in: 0..<5)
            
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
        collection_silvia()
            .environmentObject(UserData())
    }
}
