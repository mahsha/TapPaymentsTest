//
//  AppInjectorContainer.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import Foundation

final class AppInjectorContainer {
  
  func buildAlbumsInjectorContainer() -> AlbumsInjectorContainer {
    return AlbumsInjectorContainer()
  }
}
