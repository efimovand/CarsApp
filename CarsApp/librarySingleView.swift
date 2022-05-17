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
                    
                    //libraryElement("alfa romeo 4c")
                    
                    CustomContextMenu(content: {
                        
                        libraryElement("alfa romeo 4c")
                        
                    }, preview: {
                        
                        Text("Hello")
                        
                    }, actions: {
                        
                        return UIMenu(title: "", children: [])
                        
                    })
                    
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
                    
                    libraryElement("vw beetle")
                    
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
        
        if !data.unlockedCars.contains(car){
            
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


// Context Menu for elements
struct CustomContextMenu<Content: View, Preview: View>: View {
    
    var content: Content
    var preview: Preview
    
    var menu: UIMenu
    
    init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder preview: @escaping () -> Preview, actions: @escaping () -> UIMenu){
        
        self.content = content()
        self.preview = preview()
        self.menu = actions()
        
    }
    
    var body: some View{
        
        ZStack{
            
            content
                .hidden()
                .overlay(
                    ContextMenuHelper(content: content, preview: preview, actions: menu)
                )
            
        }
        
    }
    
}


// Custom View for Context Menu
struct ContextMenuHelper<Content: View, Preview: View>: UIViewRepresentable {
    
    var content: Content
    var preview: Preview
    var actions: UIMenu
    
    init(content: Content, preview: Preview, actions: UIMenu){
        self.content = content
        self.preview = preview
        self.actions = actions
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            hostView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            hostView.view.heightAnchor.constraint(equalTo: view.heightAnchor),
        ]
        
        view.addSubview(hostView.view)
        view.addConstraints(constraints)
        
        let interaction = UIContextMenuInteraction(delegate: context.coordinator)
        view.addInteraction(interaction)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIContextMenuInteractionDelegate{
        
        var parent: ContextMenuHelper
        
        init(parent: ContextMenuHelper){
            self.parent = parent
        }
        
        func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            
            return UIContextMenuConfiguration(identifier: nil) {
                
                let previewController = UIHostingController(rootView: self.parent.preview)
                
                previewController.view.backgroundColor = .purple
                
                return previewController
                
            } actionProvider: { items in
                
                return self.parent.actions
                
            }
            
        }
        
    }
    
}


struct librarySingleView_Previews: PreviewProvider {
    static var previews: some View {
        librarySingleView()
            .environmentObject(UserData())
    }
}
