//
//  galleryView.swift
//  CarsApp
//
//  Created by Андрей Ефимов on 10.05.2022.
//

import SwiftUI

struct galleryView: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        
        // Gallery
        Text("Gallery")
        
    }
    
}

struct galleryView_Previews: PreviewProvider {
    static var previews: some View {
        galleryView()
            .environmentObject(UserData())
    }
}
