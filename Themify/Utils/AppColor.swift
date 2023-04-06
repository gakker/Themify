//
//  AppColor.swift
//  Themify
//
//  Created by Brilliant Gamez on 3/16/22.
//

import Foundation
import SwiftUI

class AppColor{
    let backgroundColors: [Color] = [Color(red: 0.2, green: 0.85, blue: 0.7), Color(red: 0.13, green: 0.55, blue: 0.45)]
    
    
    
    static var colorPrimary: Color = Color(red: 0.69, green: 0.92, blue: 0.82)
    
    static var colorPrimaryDark: Color = Color(red: 0.77, green: 0.94, blue: 0.79)
    
    static var colorPrimaryLight: Color = Color(red: 0.86, green: 0.97, blue: 0.93)
    
    static var colorSecondary: Color = Color(red: 0.27, green: 0.27, blue: 0.28)
    
    static var colorSecondaryDark: Color = Color(red: 0.23, green: 0.22, blue: 0.23)
    
    static var colorSecondaryLight: Color = Color(red: 0.27, green: 0.28, blue: 0.30)
    
    static var colorDarkGrey: Color = Color(red: 0.45, green: 0.45, blue: 0.45)
    
    static var colorGrey: Color = Color(red: 0.66, green: 0.66, blue: 0.66)
    
    static var colorLightGrey: Color = Color(red: 0.73, green: 0.73, blue: 0.73)
    
    static var colorBlack: Color = Color(red: 0, green: 0, blue: 0)
    
    static var colorOrange: Color = Color(red: 0.99, green: 0.60, blue: 0.01)
    
    static var colorWhite: Color = Color(red: 1, green: 1, blue: 1)
    
    static var blue: Color = Color(hexStringToUIColor(hex: "#2E73EB"))
    
    static var paymentItemGradient = LinearGradient(gradient: Gradient(colors: [skyBlue.opacity(0.1),blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
    
    static var greenGradient = LinearGradient(gradient: Gradient(colors: [Color.green,Color.green.opacity(0.5),Color.green.opacity(0.5),Color.green.opacity(0.5),Color.green.opacity(0.5),Color.green.opacity(0)]), startPoint: .top, endPoint: .bottom)
    
    let whiteGradientColors: [Color] = [colorSecondary.opacity(0), colorSecondary.opacity(0.48) , colorSecondary.opacity(0.48),colorSecondary.opacity(1)]
    
    static var whiteGradientBackground = LinearGradient(gradient: Gradient(colors: [colorSecondary.opacity(0), colorSecondary.opacity(0.48),colorSecondary.opacity(1),colorSecondary.opacity(1)]), startPoint: .top, endPoint: .bottom)
    
    static var skyBlue: Color = Color(hexStringToUIColor(hex: "#2EB2EB"))
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}
