//
//  IconInstallItem.swift
//  Themify
//
//  Created by Brilliant Gamez on 3/10/22.
//

import SwiftUI



struct IconInstallItem: View {
    
    var icon: IconModel
    @State private var doesClose = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text(icon.name)
            HStack{
                
                   
            }
        }
    }
}

struct IconInstallItem_Previews: PreviewProvider {
    
    static var iconModel = IconModel(id: 1, name: "", url: "", bundleId: "", imageName: "app_store", icon: "app_store")
    
    static var previews: some View {
        IconInstallItem(icon: iconModel)
    }
}


