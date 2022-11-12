//
//  AppCoordinator.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import UIKit


class AppCoordinator {
  
  fileprivate let navigationController: UINavigationController
  fileprivate let appInjectorContainer: AppInjectorContainer
  init(with navigationController: UINavigationController, appInjectorContainer: AppInjectorContainer) {
    self.navigationController = navigationController
    self.appInjectorContainer = appInjectorContainer
  }
  
  func start() {
    let albumsInjectorContainer = appInjectorContainer.buildAlbumsInjectorContainer()
    let coordinator = albumsInjectorContainer.buildAlbumsCoordinator(navigationController: navigationController)
    coordinator.start()
  }
  
}



