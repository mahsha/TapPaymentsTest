//
//  Album.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//

import Foundation

struct Album: Decodable {
  let artistName: String?
  let artworkUrl100: String?
  let collectionName: String?
  let collectionPrice: Double?
  let copyright: String?
  let currency: String?
  let primaryGenreName: String?
  let country: String?
  let trackCount: Int?
}
