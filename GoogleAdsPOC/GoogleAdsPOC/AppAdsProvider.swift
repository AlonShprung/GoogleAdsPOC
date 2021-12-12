//
//  AppAdsProvider.swift
//
//  Created by Alon Shprung on 12/12/2021.
//

import UIKit
import GoogleMobileAds

final class AppAdsProvider: NSObject, AdsProvider {
    private var banner: GAMBannerView?
    
    var bannerDelegate: AdsProviderBannerDelegate?
    
    func setupAdsBanner(with adId: String, in controller: UIViewController, size: CGSize) {
        
        let sizes: [NSValue] = [
            NSValueFromGADAdSize(
                GADAdSizeFromCGSize(size)
            )
        ]
        
        banner = GAMBannerView()
        banner?.validAdSizes = sizes
        banner?.adUnitID = adId
        banner?.delegate = self
        banner?.rootViewController = controller
        let req = GAMRequest()
        banner?.load(req)
    }
        
}

extension AppAdsProvider: GADBannerViewDelegate {
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerDelegate?.bannerLoaded(bannerView: bannerView, adBannerSize: bannerView.adSize.size, adUnitID: bannerView.adUnitID ?? "")
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        bannerDelegate?.bannerFailedToLoad(error: error)
    }
}
