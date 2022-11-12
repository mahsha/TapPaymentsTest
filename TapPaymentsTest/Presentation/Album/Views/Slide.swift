//
//  Slide.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//

import UIKit
import SDWebImage
class Slide: UIView {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var labelDesc: UILabel!
  
  static func createSlide(album: Album) -> Slide {
    let slide: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
    slide.bind(album: album)
    return slide
  }
  
  func bind(album: Album) {
    imageView.sd_setImage(with: URL(string: album.artworkUrl100 ?? ""))
    labelDesc.text = """
  CollectionName: \(album.collectionName ?? "")
  ArtistName: \(album.artistName ?? "")
  Genre: \(album.primaryGenreName ?? "")
  Country: \(album.country ?? "")
  Price: \(album.collectionPrice ?? 0.0) \(album.currency ?? "")
  Copyright \(album.copyright ?? "")
  Tracks: \(album.trackCount ?? 0)
"""
  }
}
