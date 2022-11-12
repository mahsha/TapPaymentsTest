//
//  AlbumService.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//

import Foundation

protocol AlbumServiceProtocol {
  func search(query: String, success: @escaping(_ result: AlbumResponseModel) -> Void, failure: @escaping(_ error: ErrorModel) -> Void)
}

class AlbumService: NSObject, AlbumServiceProtocol {
  
  static let shared = AlbumService()
  func search(query: String, success: @escaping(_ result: AlbumResponseModel) -> Void, failure: @escaping(_ error: ErrorModel) -> Void) {

    NSObject.cancelPreviousPerformRequests(withTarget: self)
    
    RequestService.get(path: "search", params: ["term":query, "entity": "album"], headers: nil, success: { (data) in
      
      guard let response = try? JSONDecoder().decode(AlbumResponseModel.self, from: data) else {
        failure(ErrorModel.parse(string: "Parsing error."))
        return
      }
      success(response)
      
    }, failure: { (error) in
      failure(error)
    })
  }
}
