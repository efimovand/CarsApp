//
//  loseAlertView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 09.05.2022.
//

import SwiftUI

struct loseAlertView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var addLifeAlert = false
    
    @Binding var loseAlertShown: Bool
    @State var loseAlertOpacity: Double = 0
    @State var isLoading = false
    
    @State var gradientColors: [Color] = [.red, .white]
    @State var gradientColorsEdited: [Color] = [.white, .red]
    
    @State var heartOpacity: CGFloat = 1
    @State var continueOpacity: CGFloat = 0
    
    @State var hasTimeElapsed = false
    
    private func delayTime() async {
            try? await Task.sleep(nanoseconds: 3_600_000_000)
            hasTimeElapsed = true
        }
    
    var body: some View {
        
        ZStack{
        
        VStack(spacing: 16){
            
            Text("New Top Score!")
                .foregroundColor(Color.white)
                .font(Font.custom("PorterSansBlock", size: 21))
                .opacity(data.score - 1 > data.maxScore ? 1 : 0)
                .padding(.bottom, -21)
                .offset(y: -16)
            
            // Alert
            ZStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenHeight * 0.164)
                    .opacity(0.3)
                    .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.80), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                
                VStack(spacing: 6){
                    
                    Text("Your score: \(data.score - 1)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("PorterSansBlock", size: 20))
                        .frame(width: UIScreen.screenWidth * 0.8, height: 48, alignment: .leading)
                        .padding(.leading, 25)
                    
                    Text("New cars unlocked: \(data.tempCars.count)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("PorterSansBlock", size: 20))
                        .frame(width: UIScreen.screenWidth * 0.8, height: 48, alignment: .leading)
                        .padding(.leading, 25)
                        .lineSpacing(5)
                    
                }
                
            }
            
            ZStack{
            
            // Heart Circle
            ZStack{
                
                Circle()
                    .foregroundColor(Color.white)
                    .opacity(0.3)
                    .frame(width: 60, height: 60)
                    .background(.ultraThinMaterial, in: Circle())
                    .overlay(Circle().strokeBorder((Color.white).opacity(0.7), lineWidth: 2.7))
                    .overlay(Image("extraLife")
                        .resizable()
                        .frame(width: 56, height: 56, alignment: .center)
                        .offset(y: 1))
                
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(lineWidth: 3)
                    .fill(AngularGradient(gradient: .init(colors: gradientColorsEdited), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 57.4, height: 57.4)
                    .task(delayTime)
                
            }.onAppear(){
                
                withAnimation(.linear(duration: 4)) { isLoading = true }
                withAnimation(.spring()) { loseAlertOpacity = 1 }
                
            }
            .onTapGesture(perform: {
                
                if (data.extraLives < 1){
                    addLifeAlert = true
                }
                else {
                    loseAlertShown = false
                    data.loseAlertCollection = false
                    
                    data.extraLives -= 1
                    UserDefaults.standard.set(data.extraLives, forKey: "extraLives")
                }
                
            })
            .opacity(heartOpacity)
            .onChange(of: hasTimeElapsed, perform: { value in
                switch value {
                case true:
                    withAnimation(.linear(duration: 0.3)) { heartOpacity = 0 }
                    withAnimation(.linear(duration: 0.3)) { continueOpacity = 1 }
                case false: heartOpacity = 1
                }
            })
                
                // Continue Circle
                Circle()
                    .foregroundColor(Color.white)
                    .opacity(0.3)
                    .frame(width: 60, height: 60)
                    .background(.ultraThinMaterial, in: Circle())
                    .overlay(Circle().strokeBorder((Color.white).opacity(0.5), lineWidth: 2.7))
                    .overlay(Text("OK")
                        .foregroundColor(Color.white)
                        .font(Font.custom("PorterSansBlock", size: 14)))
                    .opacity(continueOpacity)
                    .onTapGesture(perform: {
                        
                        if (data.score - 1 > data.maxScore) {
                            data.maxScore = data.score - 1
                            UserDefaults.standard.set(data.maxScore, forKey: "maxScore")
                        }
                        
                        data.unlockedCars += data.tempCars
                        UserDefaults.standard.set(data.unlockedCars, forKey: "unlockedCars")
                        
                        loseAlertShown = false
                        data.loseAlertCollection = false
                        data.game = false
                        
                    })
                
            }
            
        }.opacity(loseAlertOpacity)
                .opacity(addLifeAlert ? 0 : 1)
            
            
            // Add Life Alert
            if addLifeAlert{
                addLifeAlertView(addLifeAlertShown: $addLifeAlert)
                    .scaleEffect(x: 1.2, y: 1.2)
            }
                        
        }
        
    }
    
}

struct loseAlertView_Previews: PreviewProvider {
    static var previews: some View {
        loseAlertView(loseAlertShown: .constant(false))
            .environmentObject(UserData())
            .background((Color("darkOrange")).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight).ignoresSafeArea())
    }
}
