//
//  ViewController.swift
//  GoogleAdsPOC
//
//  Created by Alon Shprung on 12/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var sdkAdView: SDKAdView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        
        let gadProvider = AppAdsProvider()
        SDKManager.setGoogleAdsProvider(googleAdsProvider: gadProvider)
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sdkAdView.setupAd(in: self)
    }
    
    private func setupUI() {
        view.addSubview(sdkAdView)
        
        sdkAdView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [
            self.sdkAdView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.sdkAdView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.sdkAdView.widthAnchor.constraint(equalToConstant: 300),
            self.sdkAdView.heightAnchor.constraint(equalToConstant: 250)
        ]
        view.addConstraints(constraints)
    }
}

