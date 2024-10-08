//
//  ContentView.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

// banner id  ca-app-pub-3940256099942544/2435281174
// interstitial id  ca-app-pub-3940256099942544/4411468910
// recompensa id  ca-app-pub-3940256099942544/1712485313

import SwiftUI

struct ContentView: View {
    
    @StateObject var ads = AdsViewModel()
    var body: some View {
        VStack {
            //Vid 471
            Text("Banner sencillo").bold()
            BannerView().frame(width: 320, height: 50)
           
            //Vid 473
            Spacer().frame(height: 30)
            Text("Interstitial Banner").bold()
            Button("Ejecutar"){
                ads.showInterstitial = true
            }
            //Vid 474
            Spacer().frame(height: 30)
            Text("Rewarded Banner").bold()
            Button("Ejecutar"){
                ads.showRewarded = true
            }
        }
        .padding()
    }
}


