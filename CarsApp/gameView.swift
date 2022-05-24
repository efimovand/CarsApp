//
//  gameView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 09.05.2022.
//

import SwiftUI

struct gameView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var cars = ["abarth 500", "alfa romeo 4c", "alfa romeo c39", "alfa romeo stradale", "aston martin db11", "audi 100 avant", "audi r18", "bmw m3 e36", "bmw m3 e46", "bmw m3 e92", "bmw m635 e24", "bmw x1", "bugatti chiron", "caterham 21", "charger rt", "chevrolet camaro", "citroen ds23", "devel sixteen", "dome zero", "fiat 500", "ford gt 40", "honda civic", "hyundai i20n", "jaguar xjs", "lamborghini diablo", "lancia 037", "lotus europa", "maserati mc12", "maybach sw38", "mazda mx5", "mazda rx7", "mclaren f1", "mercedes a45", "mercedes w25", "mitsubishi evo 7", "mitsubishi evo 8", "nissan fairylady", "nissan gtr r32", "nissan gtr r34", "nissan gtr r35", "nissan silvia s13", "nissan silvia s15", "oldsmobile gr", "porsche 911", "renault 19 16s", "renault clio", "renault megane", "subaru impreza", "suzuki hustler", "suzuki swift", "toyota coaster", "toyota corolla", "toyota fjcruiser", "toyota gt86", "toyota lc FJ43", "toyota lc76", "toyota mr2", "toyota supra", "vw beetle a4", "vw beetle classic"].shuffled()
    
    @State var collection_1 = [collection_rx7().self]
    @State var collection_2 = [collection_mx5().self]
    @State var collection_3 = [collection_jimny().self]
    @State var collection_4 = [collection_gtr().self]
    
    @State var correctAnswer = Int.random(in: 0..<4)
    @State var collectionNumber = Int.random(in: 0..<4) // Collections' amount
    
    @State var loseAlertShown: Bool = false
    
    var body: some View {
        
        ZStack{
            
            ZStack{
            
            // Game Single
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
                                
                                Button(action: {
                                    answeredSingle(number)
                                    data.useLife = false
                                }) {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color.white)
                                        .frame(width: UIScreen.screenWidth * 0.7253, height: UIScreen.screenHeight * 0.06773)
                                        .opacity(0.1)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                                    
                                    Text(cars[number])
                                        .foregroundColor(Color.white)
                                        .font((cars[number] != "alfa romeo stradale" && cars[number] != "lamborghini diablo") ? Font.custom("PorterSansBlock", size: 15) : Font.custom("PorterSansBlock", size: 13))
                                    
                                }
                                        
                                }
                                
                            }
                            
                        }.preferredColorScheme(.light)
                            .disabled(loseAlertShown ? true : false)
                        
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
                        
                        // star
                        star()
                            .frame(width: 24, height: 22, alignment: .center)
                            .foregroundColor(Color.white)
                            .offset(y: 0)
                            .opacity((data.score % 10 == 5) || (data.score % 10 == 0) ? 0.85 : 0.6) // ?
                        
                    }.offset(y: 7)
                    
                    Spacer()
                    
                }
                
            
            
                // Game Collections
                ZStack{
                    
                    ZStack{
                        collection_1[0]
                    }.opacity(collectionNumber == 0 ? 1 : 0)
                    
                    ZStack{
                        collection_2[0]
                    }.opacity(collectionNumber == 1 ? 1 : 0)
                    
                    ZStack{
                        collection_3[0]
                    }.opacity(collectionNumber == 2 ? 1 : 0)
                    
                    ZStack{
                        collection_4[0]
                    }.opacity(collectionNumber == 3 ? 1 : 0)
                    
                }.opacity(((data.score % 10 == 0) || (data.score % 10 == 5)) ? 1 : 0)
                    
            }.blur(radius: data.globalBlurRadius)
                .onChange(of: loseAlertShown || data.loseAlertCollection, perform: { value in
                    switch value {
                    case true: withAnimation(.linear(duration: 0.3)) { data.globalBlurRadius = 3 }
                    case false: withAnimation(.linear(duration: 0.3)) { data.globalBlurRadius = 0 }
                    }
                })
            
            // Lose Alert
            if loseAlertShown || data.loseAlertCollection {
                loseAlertView(loseAlertShown: $loseAlertShown)
            }
            
            // Use Life Animation
            useLifeView()
                .opacity(data.useLife ? 1 : 0)
                .offset(x: 48, y: UIScreen.screenHeight * 0.164 / 2 + 12)
            
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
            
            nextQuestion()
            
        }
        else {
            loseAlertShown = true
        }
    }

    // function for going to the next quiestion
    func nextQuestion() {
        cars.shuffle()
        correctAnswer = Int.random(in: (0..<4))
        collectionNumber = Int.random(in: (0..<4))
    }
    
}


// Use Life Animation
struct useLifeView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var useLifeOpacity: Double = 1
    @State var useLifeOffset: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            
            Text("-1")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 20))
            
        }.opacity(useLifeOpacity)
        .offset(y: useLifeOffset)
        .onChange(of: data.useLife, perform: { value in
            switch value{
            case true: withAnimation(.linear(duration: 1)) { useLifeOffset = -30; useLifeOpacity = 0 }
            case false: useLifeOffset = 0; useLifeOpacity = 1
            }
        })
        
    }
    
}


struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView()
            .environmentObject(UserData())
    }
}
