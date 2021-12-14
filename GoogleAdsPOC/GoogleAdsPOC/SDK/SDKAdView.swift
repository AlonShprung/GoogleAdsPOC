//
//  SDKView.swift
//  GoogleAdsPOC
//
//  Created by Alon Shprung on 12/12/2021.
//

import UIKit

class SDKAdView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupAd(in vc: UIViewController) {
        SDKManager.googleAdsProvider?.bannerDelegate = self
        SDKManager.googleAdsProvider?.setupAdsBanner(with: "some/id", in: vc, size: self.bounds.size)
    }
}

extension SDKAdView: AdsProviderBannerDelegate {
    func bannerLoaded(bannerView: UIView, adBannerSize: CGSize, adUnitID: String) {
        addSubview(bannerView)
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: [NSLayoutConstraint] = [
            bannerView.topAnchor.constraint(equalTo: topAnchor),
            bannerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        addConstraints(constraints)
    }
    
    func bannerFailedToLoad(error: Error) {
        print(error)
    }
}
