//
//  ThemifyApp.swift
//  Themify
//
//  Created by Brilliant Gamez on 3/4/22.
//

import SwiftUI
import RevenueCat
import AppLovinSDK

extension UserDefaults {
    
    var welcomeScreenShown: Bool {
        get{
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
    var isPremiumAccount: Bool {
        get{
            return (UserDefaults.standard.value(forKey: "premiumAccount") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "premiumAccount")
        }
    }
}

@main
struct ThemifyApp: App {
    
    init(){
        //Initilaization of MAX
        // Please make sure to set the mediation provider value to "max" to ensure proper functionality
                ALSdk.shared()!.mediationProvider = "max"
                
//                ALSdk.shared()!.userIdentifier = "USER_ID"
                
                ALSdk.shared()!.initializeSdk { (configuration: ALSdkConfiguration) in
                    // Start loading ads
                }
        
        //Initialization of ReveunueCat
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "REVENUE_CAT_API_KEY")
        Purchases.shared.collectDeviceIdentifiers()
        
        //Initialization of Adjust
        let yourAppToken = "APP_TOKEN"
        
        if let adjustId = Adjust.adid() {
                Purchases.shared.setAdjustID(yourAppToken)
            }
        
        let environment = ADJEnvironmentSandbox
        let adjustConfig = ADJConfig(
            appToken: yourAppToken,
            environment: environment,allowSuppressLogLevel: true)

        Adjust.appDidLaunch(adjustConfig)
    }
    
    var body: some Scene {
        WindowGroup {
//            if UserDefaults.standard.welcomeScreenShown{
//                ContentView()
//            }else{
//                WelcomeOne().onAppear(perform: {
//                    UserDefaults.standard.welcomeScreenShown = true
//                })
//            }
            WelcomeView()
            
            
        }
    }
    
    
}
