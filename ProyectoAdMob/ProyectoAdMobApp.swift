//
//  ProyectoAdMobApp.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

import SwiftUI
import GoogleMobileAds
@main
struct ProyectoAdMobApp: App {
    //Vid 473
    let ads = AdsViewModel()
    init(){
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ads)
        }
    }
}
