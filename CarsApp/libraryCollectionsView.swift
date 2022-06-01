//
//  libraryCollectionsView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 21.05.2022.
//

import SwiftUI

struct libraryCollectionsView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var collections = ["rx7", "mx5", "jimny", "gtr", "m3", "gti", "silvia", "pike", "tz"]
    
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
                            }
                            
                        case 3: // gtr
                            
                            ZStack{
                                Image("kpgc10_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("kpgc10") ? 0 : 1)

                                Image("kpgc110_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("kpgc110") ? 0 : 1)

                                Image("r32_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("r32") ? 0 : 1)

                                Image("r33_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("r33") ? 0 : 1)
                                
                                Image("r34_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("r34") ? 0 : 1)
                                
                                Image("r35_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("r35") ? 0 : 1)
                            }
                            
                        case 4: // m3
                            
                            ZStack{
                                Image("e30_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("e30") ? 0 : 1)

                                Image("e36_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("e36") ? 0 : 1)

                                Image("e46_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("e46") ? 0 : 1)

                                Image("e92_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("e92") ? 0 : 1)
                                
                                Image("f80_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("f80") ? 0 : 1)
                                
                                Image("g80_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("g80") ? 0 : 1)
                            }
                            
                        case 5: // gti
                            
                            ZStack{
                                Image("mk.1_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.1") ? 0 : 1)

                                Image("mk.2_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.2") ? 0 : 1)

                                Image("mk.3_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.3") ? 0 : 1)

                                Image("mk.4_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.4") ? 0 : 1)
                                
                                Image("mk.5_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.5") ? 0 : 1)
                                
                                Image("mk.6_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.6") ? 0 : 1)
                                
                                Image("mk.7_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.7") ? 0 : 1)
                                
                                Image("mk.8_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("mk.8") ? 0 : 1)
                                
                            }
                            
                        case 6: // silvia
                            
                            ZStack{
                                Image("s10_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s10") ? 0 : 1)

                                Image("s12_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s12") ? 0 : 1)

                                Image("s13_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s13") ? 0 : 1)

                                Image("s14_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s14") ? 0 : 1)
                                
                                Image("s15_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s15") ? 0 : 1)
                            }
                            
                        case 7: // pike
                            
                            ZStack{
                                Image("pao_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("pao") ? 0 : 1)

                                Image("figaro_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("figaro") ? 0 : 1)

                                Image("be-1_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("be-1") ? 0 : 1)

                                Image("s-cargo_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("s-cargo") ? 0 : 1)
                            }
                            
                        case 8: // tz
                            
                            ZStack{
                                Image("tz1_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("tz") ? 0 : 1)

                                Image("tz2_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("tz2") ? 0 : 1)

                                Image("tz3 corsa_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("tz3 corsa") ? 0 : 1)

                                Image("tz3 stradale_locked")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: tabBarHeight, alignment: .center)
                                    .ignoresSafeArea()
                                    .opacity(data.unlockedCars.contains("tz3 stradale") ? 0 : 1)
                            }

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
