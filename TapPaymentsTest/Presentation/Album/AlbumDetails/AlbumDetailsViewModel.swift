//
//  AlbumDetailsViewModel.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation

protocol AlbumDetailsViewModelInput {
  func viewDidLoad()
}

protocol AlbumDetailsViewModelOutput {
  var album: Album { get }
}

protocol AlbumDetailsViewModel: AlbumDetailsViewModelInput, AlbumDetailsViewModelOutput { }

class DefaultAlbumDetailsViewModel: AlbumDetailsViewModel {
  
  // MARK: - OUTPUT
  var album: Album
  init(album: Album) {
    self.album = album
  }
}

// MARK: - INPUT. View event methods
extension DefaultAlbumDetailsViewModel {
  func viewDidLoad() {
  }
}
