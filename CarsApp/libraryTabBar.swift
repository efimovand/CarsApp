//
//  libraryTabBar.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 21.05.2022.
//

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
            if (data.image == "singleTab" && data.selectedImage == "singleTab_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 74, height: 74)
                    .offset(y: UIScreen.screenHeight >= 812 ? 4 : 8)
            }
            else if (data.image == "collectionTab" && data.selectedImage == "collectionTab_a"){
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .frame(width: 74, height: 74)
                    .padding(.top, -5)
                    .offset(y: UIScreen.screenHeight >= 812 ? 5 : 9)
            }
        }
    }
}

// Bar View
struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(spacing: 60) {
            Spacer(minLength: 105)
            
            ForEach(0..<2) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }.padding(.horizontal, 1)
                    .offset(y: -8)
                
            }
            Spacer(minLength: 105)
            
        }
        .frame(width: UIScreen.screenWidth + 2, height: UIScreen.screenHeight * 0.1 + 2)
        .background(Rectangle()
            .fill(Color("lowerBarOrange").opacity(0.5))
            .overlay(Rectangle().stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.50), Color(red: 1, green: 1, blue: 1, opacity: 0.50)]), startPoint: .trailing, endPoint: .leading), lineWidth: 2)).offset(y: 2))
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
                ForEach(0..<2) { index in
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
            return TabItemData(image: "singleTab", selectedImage: "singleTab_a")
        case .economy:
            return TabItemData(image: "collectionTab", selectedImage: "collectionTab_a")
        }
    }
}

// Buttons' navigation
struct libraryTabBar: View {
    
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

struct libraryTabBar_Previews: PreviewProvider {
    static var previews: some View {
        libraryTabBar()
            .environmentObject(UserData())
    }
}
