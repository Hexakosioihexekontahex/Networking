//
//  AppDelegate.swift
//  Networking
//
//  Created by Roman Melnik on 28/02/2020.
//  Copyright © 2020 Roman Melnik. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var bgSessionCompletionHandler: (() -> ())?

    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        
        bgSessionCompletionHandler = completionHandler
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        let appId = Settings.appID
        
        if url.scheme != nil && url.scheme!.hasPrefix("fb\(appId)") && url.host == "authorize" {
            return ApplicationDelegate.shared.application(app, open: url, options: options)
        }
        
        return false
    }
}

