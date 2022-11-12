//
//  AlbumsCoordinator.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import Foundation
import UIKit

protocol AlbumsCoordinatorDependencies {
  func buildAlbumsViewController(actions: AlbumsViewModelActions) -> AlbumsViewController
  func buildAlbumDetailsViewController(album: Album) -> AlbumDetailsViewController
}

class AlbumCoordinator {
  let dependencies: AlbumsCoordinatorDependencies
  let navigationController: UINavigationController
  
  init(navigationController: UINavigationController, dependencies: AlbumsCoordinatorDependencies) {
    self.navigationController = navigationController
    self.dependencies = dependencies
  }
  
  func start() {
    let actions = AlbumsViewModelActions(showAlbumDetails: showAlbumDetails)
    let vc = dependencies.buildAlbumsViewController(actions: actions)
    navigationController.pushViewController(vc, animated: false)
  }
  
  private func showAlbumDetails(album: Album) {
    let vc = dependencies.buildAlbumDetailsViewController(album: album)
    navigationController.pushViewController(vc, animated: true)
  }
}
