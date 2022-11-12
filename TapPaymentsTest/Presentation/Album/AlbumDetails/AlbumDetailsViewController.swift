//
//  AlbumDetailsViewController.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController, StoryboardInstantiable {
  
  var viewModel: AlbumDetailsViewModel!
  
  class func create(with viewModel: AlbumDetailsViewModel) -> AlbumDetailsViewController {
    let vc = AlbumDetailsViewController.instantiateFromStoryboard()
    vc.viewModel = viewModel
    return vc
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    bind(to: viewModel)
    viewModel.viewDidLoad()
    setupView()
  }
  
  func bind(to viewModel: AlbumDetailsViewModel) {
    
  }
  
  private func setupView() {
    let slide = Slide.createSlide(album: viewModel.album)
    slide.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    view.addSubview(slide)
  }
}
