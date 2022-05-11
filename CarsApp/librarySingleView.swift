//
//  librarySingleView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 11.05.2022.
//

import SwiftUI

struct librarySingleView: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 19){
                
            HStack(spacing: 19){
                    
                    libraryElement("alfa romeo 4c", "alfa romeo 4c_locked")
                    
                    libraryElement("nissan silvia s13", "nissan silvia s13_locked")
                    
                    libraryElement("toyota corolla", "toyota corolla_locked")
                    
                }
                
                HStack(spacing: 19){
                        
                    libraryElement("", "")
                    
                    libraryElement("", "")
                    
                    libraryElement("", "")
                        
                    }
                
                HStack(spacing: 19){
                        
                    libraryElement("", "")
                    
                    libraryElement("", "")
                    
                    libraryElement("", "")
                        
                    }
                
                HStack(spacing: 19){
                        
                    libraryElement("", "")
                    
                    libraryElement("", "")
                    
                    libraryElement("", "")
                        
                    }
                
                HStack(spacing: 19){
                        
                    libraryElement("", "")
                    
                    libraryElement("", "")
                    
                    libraryElement("", "")
                        
                    }
                
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
    
    // function for formatting car image
    func libraryCarImage(_ car: Image) -> some View {
        return car.resizable().frame(width: 150, height: 150, alignment: .center).offset(y: -15)
    }
    
    // function for creating library element with car
    func libraryElement(_ car: String, _ lockedCar: String) -> some View {
        
        if data.unlockedCars.contains(car){
            
            return AnyView(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.white)
                .opacity(0.1)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                .overlay(libraryCarImage(Image(car))))
            
        }
        else {
            
            return AnyView(RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 0.54, green: 0.54, blue: 0.54), Color(red: 0.16, green: 0.16, blue: 0.16)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(1)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.60), Color(red: 1, green: 1, blue: 1, opacity: 0.40)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                .overlay(libraryCarImage(Image(lockedCar))))
            
        }
        
    }
    
}

struct librarySingleView_Previews: PreviewProvider {
    static var previews: some View {
        librarySingleView()
            .environmentObject(UserData())
    }
}
