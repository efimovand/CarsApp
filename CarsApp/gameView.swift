//
//  gameView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 09.05.2022.
//

import SwiftUI

struct gameView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var cars = ["abarth 500", "alfa romeo 4c", "alfa romeo c39", "aston martin db11", "audi 100 avant", "bmw m3 e36", "bmw m3 e46", "bmw m3 e92", "bmw m635 e24", "bmw x1", "bugatti chiron", "caterham 21", "charger rt", "chevrolet camaro", "citroen ds23", "honda civic", "hyundai i20n", "jaguar xjs", "lamborghini diablo", "lancia 037", "maserati mc12", "maybach sw38", "mazda mx5", "mazda rx7", "mclaren f1", "mercedes a45", "mercedes w25", "mitsubishi evo 7", "mitsubishi evo 8", "nissan gtr r32", "nissan gtr r34", "nissan gtr r35", "nissan silvia s13", "nissan silvia s15", "porsche 911", "renault 19 16s", "renault clio", "renault megane", "subaru impreza", "suzuki hustler", "suzuki swift", "toyota corolla", "toyota fjcruiser", "toyota gt86", "toyota lc FJ43", "toyota lc76", "toyota mr2", "toyota supra", "vw beetle"].shuffled()
    
    @State var collections = [collection_rx7().self].shuffled()
    
    @State var correctAnswer = Int.random(in: 0..<4)
    
    @State var loseAlertShown: Bool = false
    
    var body: some View {
        
        ZStack{
            
            ZStack{
            
            // Game Single
            if ((data.score % 10) != 0 && (data.score % 10 != 5)) {
                
                VStack(spacing: 15){
                    
                    VStack(spacing: 28){
                        
                        // Header
                        ZStack{
                            
                            Image("road")
                                .resizable()
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 1.05, alignment: .center)
                                .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 80, br: 80))
                            
                            Image(cars[correctAnswer])
                                .resizable()
                                .frame(width: 413, height: 423, alignment: .center)
                                .padding(.all, -50)
                            
                        }
                        
                        // Buttons
                        VStack(spacing: 25){
                            
                            ForEach(0..<4) { number in
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .frame(width: 272, height: 55)
                                        .opacity(0.1)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                                    
                                    Text(cars[number])
                                        .foregroundColor(Color.white)
                                        .font(Font.custom("PorterSansBlock", size: 15))
                                        .onTapGesture(perform: {
                                            answeredSingle(number)
                                        })
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    
                    // Answers dots
                    HStack(spacing: 7){
                        
                        // dots
                        HStack(spacing: 7){
                            ForEach(1..<5) { number in
                                Circle()
                                    .foregroundColor(Color.white)
                                    .opacity((data.score % 10 == number || data.score % 10 == number + 5) ? 0.85 : 0.6) // ?
                                    .frame(width: 14.5, height: 14.5)
                            }
                        }
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                            .foregroundColor(Color.white)
                            .opacity((data.score % 10 == 5) || (data.score % 10 == 0) ? 0.85 : 0.6) // ?
                        
                    }
                    
                    Spacer()
                    
                }
                
            }
            
            // Game Collections
            else {
                collections[0] // [correctAnswer]
            }
                
            }.blur(radius: data.loseBlurRadius)
                .onChange(of: loseAlertShown || data.loseAlertCollection, perform: { value in
                    switch value {
                    case true: withAnimation(.linear(duration: 0.3)) { data.loseBlurRadius = 3 }
                    case false: withAnimation(.linear(duration: 0.3)) { data.loseBlurRadius = 0 }
                    }
                })
            
            // Lose Alert
            if loseAlertShown || data.loseAlertCollection {
                loseAlertView(loseAlertShown: $loseAlertShown)
            }
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background((LinearGradient(colors: [Color("lightOrange"), Color("darkOrange")], startPoint: .top, endPoint: .bottom))
                .overlay(gridView()
                    .foregroundColor(Color("gridGray"))
                    .opacity(0.15))
                    .ignoresSafeArea())
            .statusBar(hidden: true)
        
    }
    
    // checking is tapped answer right
    func answeredSingle(_ tag: Int) {
        if tag == correctAnswer {
            
            data.score += 1
            
            if !(data.unlockedCars.contains(cars[tag] as String)) {
                data.tempCars.append(cars[tag] as String)
            }
            
            nextQuestionSingle()
            
        }
        else {
            loseAlertShown = true
        }
    }

    // function for going to the next quiestion
    func nextQuestionSingle() {
        cars.shuffle()
        correctAnswer = Int.random(in: (0..<4))
    }
    
}


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
                
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 150)
                    .opacity(0.5)
                    .onTapGesture(perform: {
                        answeredCollection(number)
                    })
                    
                }
                    
            }.padding(.top)
            
            // Question
            Text("Guess the '\(cars[correctAnswer])'")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 20))
                .offset(y: UIScreen.screenHeight * 0.4)
            
        }.ignoresSafeArea()
            //.blur(radius: data.loseBlurRadius)
        
    }
    
    // checking is tapped answer right
    func answeredCollection(_ tag: Int) {
        
        if tag == correctAnswer {
            
            data.score += 1
            
            if !(data.unlockedCars.contains(cars[tag] as String)) {
                data.tempCars.append(cars[tag] as String)
            }
            
            nextQuestionCollection()
            
        }
        else {
            data.loseAlertCollection = true
        }
        
    }
    
    // function for going to the next quiestion
    func nextQuestionCollection() {
        cars.shuffle()
        correctAnswer = Int.random(in: (0..<cars.count))
    }
    
}


struct gameView_Previews: PreviewProvider {
    static var previews: some View {
//        gameView()
//            .environmentObject(UserData())
        collection_rx7()
            .environmentObject(UserData())
    }
}
