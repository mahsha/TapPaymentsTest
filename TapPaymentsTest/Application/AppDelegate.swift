//
//  AppDelegate.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  let appInjectorContainer = AppInjectorContainer()
  var appCoordinator: AppCoordinator?
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let navigationController = UINavigationController()
    
    window?.rootViewController = navigationController
    appCoordinator = AppCoordinator(with: navigationController,
                                    appInjectorContainer: appInjectorContainer)
    appCoordinator?.start()
    window?.makeKeyAndVisible()
    
    return true
  }
}

