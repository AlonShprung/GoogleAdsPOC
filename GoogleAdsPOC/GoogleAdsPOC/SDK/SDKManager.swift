//
//  SDKManager.swift
//  GoogleAdsPOC
//
//  Created by Alon Shprung on 12/12/2021.
//

import Foundation

public class SDKManager {
    
    public static var googleAdsProvider: AdsProvider?
    
    public static func setGoogleAdsProvider(googleAdsProvider: AdsProvider) {
        self.googleAdsProvider = googleAdsProvider
    }
}
