//
//  gameView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 09.05.2022.
//

import SwiftUI

struct gameView: View {
    
    @State var cars = ["abarth 500", "alfa romeo 4c", "alfa romeo c39", "aston martin db11", "audi 100 avant", "bmw m3 e36", "bmw m3 e46", "bmw m3 e92", "bmw m635 e24", "bmw x1", "bugatti chiron", "caterham 21", "charger rt", "chevrolet camaro", "citroen ds23", "honda civic", "hyundai i20n", "jaguar xjs", "lamborghini diablo", "lancia 037", "maserati mc12", "maybach sw38", "mazda mx5", "mazda rx7", "mclaren f1", "mercedes a45", "mercedes w25", "mitsubishi evo 7", "mitsubishi evo 8", "nissan gtr r32", "nissan gtr r34", "nissan gtr r35", "nissan silvia s13", "nissan silvia s15", "porsche 911", "renault 19 16s", "renault clio", "renault megane", "subaru impreza", "suzuki hustler", "suzuki swift", "toyota corolla", "toyota fjcruiser", "toyota gt86", "toyota lc FJ43", "toyota lc76", "toyota mr2", "toyota supra", "vw beetle"].shuffled()
    @State var correctAnswer = Int.random(in: 0..<4)
    
    @State var score: Int = 0
    
    var body: some View {
        
        ZStack{
            
            // Game Single
            if (score+1 % 10 != 0 && score+1 % 10 != 5) {
            
            VStack(spacing: 43){
                
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
                        .onTapGesture(perform: {
                            print(cars.count)
                        })
                    
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
                                    buttonTapped(number)
                                })
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
                                .opacity((score+1 % 10 == number) ? 0.85 : 0.6) // ?
                                .frame(width: 14.5, height: 14.5)
                        }
                    }
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(Color.white)
                        .opacity((score+1 % 10 == 5) || (score+1 % 10 == 0) ? 0.85 : 0.6) // ?
                    
                }
                
                Spacer()
                
            }
                
            }
            
            // Game Collections
            else {
                //
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
    func buttonTapped(_ tag: Int) {
        if tag == correctAnswer {
            score += 1
            nextQuestion()
            print(score % 10)
        }
        else {
            // Lose Alert
        }
    }

    // function for going to the next quiestion
    func nextQuestion() {
        cars.shuffle()
        correctAnswer = Int.random(in: (0..<4))
    }
    
}


struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView()
    }
}
