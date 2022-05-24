//
//  menuView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 08.05.2022.
//

import SwiftUI

struct menuView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var addLifeAlertShown: Bool = false
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                
                VStack(spacing: 40){
                    
                    
                    // Header
                    ZStack{
                        
                        Image("road")
                            .resizable()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 1.05, alignment: .center)
                            .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 80, br: 80))
                        
                        Image("toyota corolla")
                            .resizable()
                            .frame(width: 413, height: 423, alignment: .center)
                            .padding(.all, -50)
                        
                        // Logo
                        Image("logo")
                            .resizable()
                            .frame(width: 290, height: 290)
                            .offset(y: -80)
                            .onTapGesture(perform: {
                                data.unlockedCars = []
                                UserDefaults.standard.set(data.unlockedCars, forKey: "unlockedCars")
                            })
                        
                    }
                    
                    // Buttons
                    VStack(spacing: 30){
                        
                        // Play Button
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .frame(width: 272, height: 70)
                                .opacity(0.1)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                            
                            Text("Play")
                                .foregroundColor(Color.white)
                                .font(Font.custom("PorterSansBlock", size: 38))
                            
                        }
                        .onTapGesture(perform: {
                            data.score = 1
                            data.tempCars = []
                            data.game = true
                        })
                        
                        // Library Button
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .frame(width: 272, height: 70)
                                .opacity(0.1)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                            
                            Text("Cars")
                                .foregroundColor(Color.white)
                                .font(Font.custom("PorterSansBlock", size: 38))
                            
                        }
                        .onTapGesture(perform: {
                            data.library = true
                        })
                        
                        // Top Score
                        if data.maxScore > 0 {
                            
                        star()
                            .foregroundColor(Color.white)
                            .opacity(0.1)
                            .overlay(star().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                            .frame(width: 80, height: 70)
                            .background(.ultraThinMaterial, in: star())
                            .overlay(Text("\(data.maxScore)")
                                .foregroundColor(Color.white)
                                .font(data.maxScore < 10 ? Font.custom("PorterSansBlock", size: 26) : Font.custom("PorterSansBlock", size: 20))
                                .offset(x: 1, y: 3))
                            .offset(y: -8)
                            
                        }
                        
                    }.preferredColorScheme(.light)
                    
                    Spacer()
                    
                }.blur(radius: data.globalBlurRadius)
                    .onChange(of: addLifeAlertShown, perform: { value in
                        switch value {
                        case true: withAnimation(.linear(duration: 0.3)) { data.globalBlurRadius = 3 }
                        case false: withAnimation(.linear(duration: 0.3)) { data.globalBlurRadius = 0 }
                        }
                    })
                
                // Lower Bar
                ZStack{

                    // Settings Button
                    Button(action: {
                        // settings
                    }) {
                        Image("settings")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .opacity(0.5)
                    }.frame(width: UIScreen.screenWidth * 0.98, height: UIScreen.screenHeight * 0.95, alignment: .bottomTrailing)
                    
                    
                    // Extra Lives
                    Button(action: {
                        addLifeAlertShown.toggle()
                    }) {
                        Image("extraLife")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .overlay(Text(String(data.extraLives))
                                .foregroundColor(Color.white)
                                .font(Font.custom("PorterSansBlock", size: 18))
                                .opacity(0.75)
                                .offset(x: 1, y: -2))
                            .overlay(heart().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .leading, endPoint: .trailing), lineWidth: 2).frame(width: 53, height: 48))
                    }.frame(width: UIScreen.screenWidth * 0.955, height: UIScreen.screenHeight * 0.96, alignment: .bottomLeading)
                    
                }
                
                if addLifeAlertShown {
                    addLifeAlertView(addLifeAlertShown: $addLifeAlertShown)
                        .offset(y: 30)
                }
                
            }
            
            // Play
            if data.game {
                gameView()
            }
            
            // Library
            if data.library {
                libraryTabBar()
            }
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background((LinearGradient(colors: [Color("lightOrange"), Color("darkOrange")], startPoint: .top, endPoint: .bottom))
                .overlay(gridView()
                    .foregroundColor(Color("gridGray"))
                    .opacity(0.15))
                    .ignoresSafeArea())
            .background(Color.orange)
            .statusBar(hidden: true)
        
    }
    
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
            .environmentObject(UserData())
    }
}
