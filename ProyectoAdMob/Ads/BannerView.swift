//
//  BannerView.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

import SwiftUI
import GoogleMobileAds
struct BannerView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GADBannerView {
        let adView = GADBannerView(adSize: GADAdSizeBanner)
        adView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        adView.rootViewController = UIApplication.shared.getRootViewController()
        adView.load(GADRequest())
        return adView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
        
    }
   
}

extension UIApplication {
    
    func getRootViewController() -> UIViewController {
        guard let screen = self.connectedScenes.first as? UIWindowScene else { return .init() }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
    
}


