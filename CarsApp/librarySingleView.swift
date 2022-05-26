//
//  librarySingleView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 11.05.2022.
//

import SwiftUI

struct librarySingleView: View {
    
    @EnvironmentObject var data: UserData
    
    @State var backgroundOffset: CGFloat = 0
    
    @State var selectedPage: Int = 0
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 20){
                
                // Pages
                TabView(selection: $selectedPage){
                    
                    // Page 1
                    VStack(spacing: 19){
                        
                        HStack(spacing: 19){
                            
                            libraryElement("alfa romeo 4c")
                            
                            //                    CustomContextMenu(content: {
                            //
                            //                        libraryElement("alfa romeo 4c")
                            //
                            //                    }, preview: {
                            //
                            //                        Text("Hello")
                            //
                            //                    }, actions: {
                            //
                            //                        return UIMenu(title: "", children: [])
                            //
                            //                    })
                            
                            libraryElement("nissan silvia s13")
                            
                            libraryElement("toyota corolla")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("mclaren f1")
                            
                            libraryElement("jaguar xjs")
                            
                            libraryElement("lamborghini diablo")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("abarth 500")
                            
                            libraryElement("fiat 500")
                            
                            libraryElement("vw beetle classic")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("mazda mx5")
                            
                            libraryElement("mazda rx7")
                            
                            libraryElement("nissan fairylady")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("nissan gtr r32")
                            
                            libraryElement("nissan gtr r34")
                            
                            libraryElement("nissan gtr r35")
                            
                        }
                        
                    }.tag(0)
                    
                    // Page 2
                    VStack(spacing: 19){
                        
                        HStack(spacing: 19){
                            
                            libraryElement("hyundai i20n")
                            
                            libraryElement("renault clio")
                            
                            libraryElement("renault megane")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("subaru impreza")
                            
                            libraryElement("mitsubishi evo 7")
                            
                            libraryElement("mitsubishi evo 8")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("toyota corolla")
                            
                            libraryElement("toyota mr2")
                            
                            libraryElement("honda civic")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("bmw m635 e24")
                            
                            libraryElement("bmw m3 e36")
                            
                            libraryElement("bmw m3 e46")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("bmw m635 e24")
                            
                            libraryElement("bmw x1")
                            
                            libraryElement("vw beetle a4") // (?) BMW
                            
                        }
                        
                    }.tag(1)
                    
                    // Page 3
                    VStack(spacing: 19){
                        
                        HStack(spacing: 19){
                            
                            libraryElement("mercedes w25")
                            
                            libraryElement("maybach sw38")
                            
                            libraryElement("mercedes a45")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("lotus europa")
                            
                            libraryElement("ford gt 40")
                            
                            libraryElement("maserati mc12")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("devel sixteen")
                            
                            libraryElement("audi r18")
                            
                            libraryElement("bugatti chiron")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("lancia 037")
                            
                            libraryElement("renault 19 16s")
                            
                            libraryElement("alfa romeo stradale")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("toyota gt86")
                            
                            libraryElement("toyota supra")
                            
                            libraryElement("porsche 911")
                            
                        }
                        
                    }.tag(2)
                    
                    // Page 4
                    VStack(spacing: 19){
                        
                        HStack(spacing: 19){
                            
                            libraryElement("charger rt")
                            
                            libraryElement("oldsmobile gr")
                            
                            libraryElement("chevrolet camaro")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("citroen ds23")
                            
                            libraryElement("dome zero")
                            
                            libraryElement("caterham 21")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("toyota lc FJ43")
                            
                            libraryElement("toyota lc76")
                            
                            libraryElement("toyota fjcruiser")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("toyota mr2")
                            
                            libraryElement("nissan silvia s13")
                            
                            libraryElement("nissan silvia s15")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("audi 100 avant")
                            
                            libraryElement("aston martin db11")
                            
                            libraryElement("hyundai i20n")
                            
                        }
                        
                    }.tag(3)
                    
                    // Page 5
                    VStack(spacing: 19){
                        
                        HStack(spacing: 19){
                            
                            libraryElement("toyota coaster")
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                        }
                        
                        HStack(spacing: 19){
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                            libraryElement("")
                            
                        }
                        
                    }.tag(4)
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            
                // Scroll Dots
                HStack(spacing: 5){

                    // Page 1
                    Circle()
                        .foregroundColor(Color.white)
                        .opacity((selectedPage == 0) ? 0.7 : 0.5)
                        .frame(width: 14.5, height: 14.5)

                    // Page 2
                    Circle()
                        .foregroundColor(Color.white)
                        .opacity((selectedPage == 1) ? 0.7 : 0.5)
                        .frame(width: 14.5, height: 14.5)

                    // Page 3
                    Circle()
                        .foregroundColor(Color.white)
                        .opacity((selectedPage == 2) ? 0.7 : 0.5)
                        .frame(width: 14.5, height: 14.5)

                    // Page 4
                    Circle()
                        .foregroundColor(Color.white)
                        .opacity((selectedPage == 3) ? 0.7 : 0.5)
                        .frame(width: 14.5, height: 14.5)
                    
                    // Page 5
                    Circle()
                        .foregroundColor(Color.white)
                        .opacity((selectedPage == 4) ? 0.7 : 0.5)
                        .frame(width: 14.5, height: 14.5)

                }.offset(y: -5)
                
                Spacer(minLength: 110)
                
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
    func libraryElement(_ car: String) -> some View {
        
        @State var lockedCar: String = car + "_locked"
        
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
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.40), Color(red: 1, green: 1, blue: 1, opacity: 0.30)]), startPoint: .leading, endPoint: .trailing), lineWidth: 1))
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
                .overlay(libraryCarImage(Image(lockedCar))))
            
        }
        
    }
    
}


//// Context Menu for elements
//struct CustomContextMenu<Content: View, Preview: View>: View {
//
//    var content: Content
//    var preview: Preview
//
//    var menu: UIMenu
//
//    init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder preview: @escaping () -> Preview, actions: @escaping () -> UIMenu){
//
//        self.content = content()
//        self.preview = preview()
//        self.menu = actions()
//
//    }
//
//    var body: some View{
//
//        ZStack{
//
//            content
//                .hidden()
//                .overlay(
//                    ContextMenuHelper(content: content, preview: preview, actions: menu)
//                )
//
//        }
//
//    }
//
//}
//
//
//// Custom View for Context Menu
//struct ContextMenuHelper<Content: View, Preview: View>: UIViewRepresentable {
//
//    var content: Content
//    var preview: Preview
//    var actions: UIMenu
//
//    init(content: Content, preview: Preview, actions: UIMenu){
//        self.content = content
//        self.preview = preview
//        self.actions = actions
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//
//    func makeUIView(context: Context) -> UIView {
//
//        let view = UIView()
//        view.backgroundColor = .clear
//
//        let hostView = UIHostingController(rootView: content)
//
//        hostView.view.translatesAutoresizingMaskIntoConstraints = false
//
//        let constraints = [
//            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
//            hostView.view.heightAnchor.constraint(equalTo: view.heightAnchor),
//        ]
//
//        view.addSubview(hostView.view)
//        view.addConstraints(constraints)
//
//        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
//        view.addInteraction(interaction)
//
//        return view
//
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//
//    }
//
//    class Coordinator: NSObject, UIContextMenuInteractionDelegate{
//
//        var parent: ContextMenuHelper
//
//        init(parent: ContextMenuHelper){
//            self.parent = parent
//        }
//
//        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//
//            return UIContextMenuConfiguration(identifier: nil) {
//
//                let previewController = UIHostingController(rootView: self.parent.preview)
//
//                previewController.view.backgroundColor = .purple
//
//                return previewController
//
//            } actionProvider: { items in
//
//                return self.parent.actions
//
//            }
//
//        }
//
//    }
//
//}


struct librarySingleView_Previews: PreviewProvider {
    static var previews: some View {
        librarySingleView()
            .environmentObject(UserData())
    }
}
