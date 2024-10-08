//
//  RewardedBanner.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

import Foundation
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

//Vid 474 
class RewardedBanner: NSObject, ObservableObject {
    
    final class Rewarded: NSObject, GADFullScreenContentDelegate, ObservableObject {
        
        var interstitial: GADRewardedAd?
        let interstitialId = "ca-app-pub-3940256099942544/1712485313"
        
        override init() {
            super.init()
            requestInterstitialAd()
        }
        
        func requestInterstitialAd(){
            let request = GADRequest()
            request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            ATTrackingManager.requestTrackingAuthorization { status in
                GADRewardedAd.load(withAdUnitID: self.interstitialId, request: request) { [self] ad, error in
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
                fullScreen.present(fromRootViewController: root) {
                    print("recompensa")
                }
            }else{
                print("No esta listo")
            }
        }
        
    }
    
}
