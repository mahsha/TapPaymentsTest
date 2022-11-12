//
//  AlbumsViewModel.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation

struct AlbumsViewModelActions {
  let showAlbumDetails: (Album) -> Void
}

protocol AlbumsViewModelInput {
  func viewDidLoad()
  func didSelectItem(at index: Int)
}

protocol AlbumsViewModelOutput {
  var items: Observable<[Album]> { get }
}

protocol AlbumsViewModel: AlbumsViewModelInput, AlbumsViewModelOutput { }

class DefaultAlbumsViewModel: AlbumsViewModel {
  
  private let albumService: AlbumService
  private let actions: AlbumsViewModelActions?
  
  // MARK: - OUTPUT
  
  let items: Observable<[Album]> = Observable([])
  
  
  // MARK: - Init
  
  init(albumService: AlbumService, actions: AlbumsViewModelActions? = nil) {
    self.albumService = albumService
    self.actions = actions
  }
}

// MARK: - INPUT. View event methods
extension DefaultAlbumsViewModel {
  func viewDidLoad() {
    albumService.search(query: "test") { result in
      let albums =  result.results ?? []
      self.items.value = albums.sorted { $0.collectionName?.lowercased() ?? "" < $1.collectionName?.lowercased() ?? "" }
    } failure: { error in
      
    }
    
  }
  
  func didSelectItem(at index: Int) {
    if !items.value.isEmpty, items.value.count > index {
      actions?.showAlbumDetails(items.value[index])
    }
  }
}
