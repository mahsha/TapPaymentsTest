//
//  AlbumsInjectorContainer.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import UIKit

class AlbumsInjectorContainer {
  func buildAlbumsCoordinator(navigationController: UINavigationController) -> AlbumCoordinator {
    return AlbumCoordinator(navigationController: navigationController, dependencies: self)
  }
}

extension AlbumsInjectorContainer: AlbumsCoordinatorDependencies {
  func buildAlbumDetailsViewController(album: Album) -> AlbumDetailsViewController {
    return AlbumDetailsViewController.create(with: DefaultAlbumDetailsViewModel(album: album))
  }
  
  func buildAlbumsViewController(actions: AlbumsViewModelActions) -> AlbumsViewController {
    return AlbumsViewController.create(with: DefaultAlbumsViewModel(albumService: AlbumService.shared, actions: actions))
  }
}

