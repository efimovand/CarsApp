//
//  menuView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 08.05.2022.
//

import SwiftUI

struct menuView: View {
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 40){
                
                ZStack{
                
                Image("road")
                    .resizable()
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 1.05, alignment: .center)
                    .clipShape(RoundedCorners(tl: 0, tr: 0, bl: 80, br: 80))
                    
                    Image("toyota_corolla_levin")
                        .resizable()
                        .frame(width: 413, height: 423, alignment: .center)
                        .padding(.all, -50)
                    
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color(red: 235, green: 0, blue: 255))
                        .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenHeight * 0.172)
                        .overlay(Text("Logo")
                            .foregroundColor(Color.white)
                            .font(Font.custom("PorterSansBlock", size: 45)))
                        .offset(y: -18)
                    
                }
            
            // Buttons
            VStack(spacing: 30){
                
                // Play Button
                Button(action: {
                    // Play
                }) {
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
                }
                
                // Gallery Button
                Button(action: {
                    // Gallery
                }) {
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
                }
                
            }
                
                Spacer()
                
            }
            
            Button(action: {
                // settings
            }) {
                Image("settings")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .opacity(0.5)
            }.frame(width: UIScreen.screenWidth * 0.98, height: UIScreen.screenHeight * 0.95, alignment: .bottomTrailing)
            
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
    }
}
