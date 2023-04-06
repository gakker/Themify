//
//  ContentView.swift
//  Themify
//
//  Created by Brilliant Gamez on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                TabView{
                    
                    ViewWallpaper().tabItem(){
                        Image("tab_wallpaper")
                            .renderingMode(.template)
                        Text("Wallpapers")
                    }
                    
                    ViewIcons().tabItem(){
                        Image("tab_icon")
                            .renderingMode(.template)
                        Text("Icons")
                    }
                    
                    ViewWidgets().tabItem(){
                        Image("tab_widget")
                            .renderingMode(.template)
                        Text("Widgets")
                    }
                    
                    ViewThemes().tabItem(){
                        Image("tab_theme").renderingMode(.template)
                        Text("Themes")
                    }
                }.accentColor(AppColor.colorPrimary)
            }.navigationBarTitle("Theme Hub", displayMode: .inline).navigationBarItems( trailing: NavigationLink{
                SettingsView().navigationBarHidden(true)
            }label: {
                Image("icon_setting")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
