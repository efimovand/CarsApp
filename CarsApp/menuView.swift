//
//  menuView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 08.05.2022.
//

import SwiftUI

struct menuView: View {
    
    @EnvironmentObject var data: UserData
    
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
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color(red: 235, green: 0, blue: 255))
                            .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.172)
                            .overlay(Text("Logo")
                                .foregroundColor(Color.white)
                                .font(Font.custom("PorterSansBlock", size: 45)))
                            .offset(y: -18)
                            .onTapGesture(perform: {
                                data.maxScore = 0
                                data.unlockedCars = []
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
                        
                        // Gallery Button
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
                            data.gallery = true
                        })
                        
                    }
                    
                    Spacer()
                    
                }
                
                HStack(spacing: UIScreen.screenWidth * 0.98 - 120){
                    
                    // Top Score
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                        .opacity(0.5)
                        .overlay(Text("\(data.maxScore)")
                            .foregroundColor(Color.white)
                            .font(Font.custom("PorterSansBlock", size: 12))
                            .offset(y: 2))
                
                    // Settings Button
                Button(action: {
                    // settings
                }) {
                    Image("settings")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .opacity(0.5)
                }
                    
                }.frame(height: UIScreen.screenHeight * 0.95, alignment: .bottom)
                
            }
            
            // Play
            if data.game {
                gameView()
            }
            
            // Gallery
            if data.gallery {
                galleryView()
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
    
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
            .environmentObject(UserData())
    }
}
