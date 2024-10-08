//
//  AdsViewModel.swift
//  ProyectoAdMob
//
//  Created by Paul F on 07/10/24.
//

import Foundation

//Vid 173
class AdsViewModel: ObservableObject {
    @Published var interstitial = InterstitialBanner.Interstitial()
    //Vid 174
    @Published var rewarded = RewardedBanner.Rewarded()
    
    @Published var showInterstitial = false {
        didSet {
            //si es verdadero
            if showInterstitial {
                interstitial.showAd()
                showInterstitial = false
            }else {
                interstitial.requestInterstitialAd()
            }
        }
    }
    //Vid 174 
    @Published var showRewarded = false {
        didSet {
            if showRewarded {
                rewarded.showAd()
                showRewarded = false
            }else {
                rewarded.requestInterstitialAd()
            }
        }
    }
    
}
