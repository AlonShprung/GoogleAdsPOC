//
//  AdsProvider.swift
//  GoogleAdsPOC
//
//  Created by Alon Shprung on 12/12/2021.
//

import UIKit

public protocol AdsProvider: AnyObject {
    func setupAdsBanner(with adId: String, in controller: UIViewController, size: CGSize)
    
    var bannerDelegate: AdsProviderBannerDelegate? { get set }
}

public protocol AdsProviderBannerDelegate: AnyObject {
    func bannerLoaded(bannerView: UIView, adBannerSize: CGSize, adUnitID: String)
    func bannerFailedToLoad(error: Error)
}
