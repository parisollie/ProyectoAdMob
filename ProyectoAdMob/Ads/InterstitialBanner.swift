//
//  InterstitialBanner.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

import Foundation
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

//Vid 472
class InterstitialBanner: NSObject, ObservableObject {
    // GADFullScreenContentDelegate, ObservableObject, nuestros delegados
    final class Interstitial: NSObject, GADFullScreenContentDelegate, ObservableObject {
        
        var interstitial: GADInterstitialAd?
        let interstitialId = "ca-app-pub-3940256099942544/4411468910"
        
        override init() {
            super.init()
            requestInterstitialAd()
        }
        
        func requestInterstitialAd(){
            let request = GADRequest()
            request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            ATTrackingManager.requestTrackingAuthorization { status in
                GADInterstitialAd.load(withAdUnitID: self.interstitialId, request: request) { [self] ad, error in
                    if let error = error {
                        print("Error en el banner interstitial", error.localizedDescription)
                        return
                    }
                    interstitial = ad
                    interstitial?.fullScreenContentDelegate = self
                }
            }
        }
        
        func showAd(){
            let root = UIApplication.shared.getRootViewController()
            if let fullScreen = interstitial {
                fullScreen.present(fromRootViewController: root)
            }else{
                print("No esta listo")
            }
        }
        
    }
    
}
