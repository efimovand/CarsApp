//
//  addLifeAlertView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 20.05.2022.
//

import SwiftUI

struct addLifeAlertView: View {
    
    @EnvironmentObject var data: UserData
    
    @Binding var addLifeAlertShown: Bool
    
    var body: some View {
        
        ZStack{
            
            // background
            RoundedCorners(tl: 20, tr: 0, bl: 20, br: 20)
                .foregroundColor(Color.white)
                .frame(width: 250, height: 200)
                .opacity(0.05)
                .overlay(RoundedCorners(tl: 20, tr: 0, bl: 20, br: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
            
            // Buttons
            VStack(spacing: -10){
                
                // Watch ad
                HStack(spacing: -40){
                    
                    RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10)
                        .foregroundColor(Color.white)
                        .opacity(0.4)
                        .frame(width: 200, height: 40)
                        .overlay(RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                        .overlay(Text("Watch AD").foregroundColor(Color.white).font(Font.custom("PorterSansBlock", size: 17)).frame(width: 162, height: 40, alignment: .leading))
                    
                    Image("extraLife")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay(Text("+1")
                            .foregroundColor(Color.white)
                            .font(Font.custom("PorterSansBlock", size: 18))
                            .offset(y: -3))
                    
                }.offset(x: 5)
                    .onTapGesture {
                        // start ad
                        data.extraLives += 1
                        UserDefaults.standard.set(data.extraLives, forKey: "extraLives")
                    }
                
                // 2.99$
                HStack(spacing: -40){
                    
                    RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10)
                        .foregroundColor(Color.white)
                        .opacity(0.4)
                        .frame(width: 200, height: 40)
                        .overlay(RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                        .overlay(Text("2.99$").foregroundColor(Color.white).font(Font.custom("PorterSansBlock", size: 17)).frame(width: 160, height: 40, alignment: .center))
                    
                    Image("extraLife")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay(Text("+5")
                            .foregroundColor(Color.white)
                            .font(Font.custom("PorterSansBlock", size: 17))
                            .offset(y: -3))
                    
                }.offset(x: 5)
                    .onTapGesture {
                        // payment
                        data.extraLives += 5
                        UserDefaults.standard.set(data.extraLives, forKey: "extraLives")
                    }
                
                // 9.99$
                HStack(spacing: -40){
                    
                    RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10)
                        .foregroundColor(Color.white)
                        .opacity(0.4)
                        .frame(width: 200, height: 40)
                        .overlay(RoundedCorners(tl: 20, tr: 40, bl: 20, br: 10).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                        .overlay(Text("9.99$").foregroundColor(Color.white).font(Font.custom("PorterSansBlock", size: 17)).frame(width: 160, height: 40, alignment: .center))
                    
                    Image("extraLife")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .overlay(Text("+18")
                            .foregroundColor(Color.white)
                            .font(Font.custom("PorterSansBlock", size: 16))
                            .offset(y: -3))
                    
                }.offset(x: 5)
                    .onTapGesture {
                        // payment
                        data.extraLives += 18
                        UserDefaults.standard.set(data.extraLives, forKey: "extraLives")
                    }
                
            }
            
            // Exit Button
                Circle()
                    .fill(Color(red: 1, green: 1, blue: 1).opacity(0.3))
                    .background(.ultraThinMaterial, in: Circle())
                    .frame(width: 21, height: 21)
                    .overlay(Image(systemName: "multiply")
                        .foregroundColor(Color.white)
                        .font(.system(size: 14)))
                    .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.80), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .topTrailing, endPoint: .bottomLeading), lineWidth: 1))
                    .frame(width: 265, height: 215, alignment: .topTrailing)
                    .onTapGesture {
                        addLifeAlertShown = false
                    }
            
        }//.preferredColorScheme(.light)
        
    }
    
}


struct addLifeAlertView_Previews: PreviewProvider {
    static var previews: some View {
        addLifeAlertView(addLifeAlertShown: .constant(false))
            .environmentObject(UserData())
            .preferredColorScheme(.dark)
    }
}
