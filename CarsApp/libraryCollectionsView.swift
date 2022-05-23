//
//  libraryCollectionsView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 21.05.2022.
//

import SwiftUI

struct libraryCollectionsView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var collections = ["rx7", "mx5", "jimny"]
    
    @State var tabBarHeight = UIScreen.screenHeight - UIScreen.screenHeight * 0.1 + 1
    
    @State var selectedPage: Int = 0
    
    var body: some View {
        
        ZStack{
                
                TabView{
                    
                    ForEach(0..<collections.count) { number in
                        
                        ZStack{
                        
                        Image(collections[number])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                            .ignoresSafeArea()
                        
                        
                        switch number {

                        case 0: // rx7

                            ZStack{
                                Image("sa22c_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("sa22c") ? 0 : 1)

                                Image("fc3s_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("fc3s") ? 0 : 1)

                                Image("fd3s_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("fd3s") ? 0 : 1)
                            }

                        case 1: // mx5

                            ZStack{
                                Image("na_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("na") ? 0 : 1)

                                Image("nb_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("nb") ? 0 : 1)

                                Image("nc_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("nc") ? 0 : 1)

                                Image("nd_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("nd") ? 0 : 1)
                            }

                        case 2: // jimny

                            ZStack{
                                Image("1970_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("1970") ? 0 : 1)

                                Image("1981_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("1981") ? 0 : 1)

                                Image("1998_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("1998") ? 0 : 1)

                                Image("2018_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("2018") ? 0 : 1)
                            }.disabled(true)

                        default: Text("")

                        }
                            
                        }
                        
                    }
                
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background((LinearGradient(colors: [Color("lightOrange"), Color("darkOrange")], startPoint: .top, endPoint: .bottom))
                .overlay(gridView()
                    .foregroundColor(Color("gridGray"))
                    .opacity(0.15))
                    .ignoresSafeArea())
        
    }
    
}

struct libraryCollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        libraryCollectionsView()
            .environmentObject(UserData())
    }
}
