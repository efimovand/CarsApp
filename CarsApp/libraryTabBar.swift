//
//  libraryTabBar.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 21.05.2022.
//

import SwiftUI

import SwiftUI

// Buttons' struct
struct TabItemData {
    let image: String
    let selectedImage: String
}

// Buttons' View
struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            if (data.image == "singleCar" && data.selectedImage == "singleCar_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 74, height: 74)
                    .offset(y: UIScreen.screenHeight >= 812 ? 1 : 5)
            }
            else if (data.image == "manyCars" && data.selectedImage == "emanyCars_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 81, height: 81)
                    .padding(.top, -7)
                    .offset(y: UIScreen.screenHeight >= 812 ? 2 : 6)
            }
        }
    }
}

// Bar View
struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 92
    var width: CGFloat = UIScreen.screenWidth
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer(minLength: 105)
            
            ForEach(tabbarItems.indices) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }.padding(.horizontal, 1)
                    .offset(y: -8)
                
            }
            Spacer(minLength: 103)
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.113)
        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0)
                        .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.40))
                        .overlay(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .trailing, endPoint: .leading), lineWidth: 1)))
    }
}

// Views + TabBar
struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            .frame(width: .infinity, height: .infinity)
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }.ignoresSafeArea()
            
        }
    }
}

// Buttons' logic
enum TabType: Int, CaseIterable {
    case main = 0
    case economy
    
    var tabItem: TabItemData {
        switch self {
        case .main:
            return TabItemData(image: "singleCar", selectedImage: "singleCar_a")
        case .economy:
            return TabItemData(image: "manyCars", selectedImage: "manyCars_a")
        }
    }
}

// Buttons' navigation
struct MainTabView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .main
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .main:
            librarySingleView()
        case .economy:
            libraryCollectionsView()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
