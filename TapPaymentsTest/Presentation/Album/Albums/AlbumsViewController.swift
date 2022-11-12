//
//  AlbumsViewController.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 11/11/2022.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit
class AlbumsViewController: UIViewController, StoryboardInstantiable , UIScrollViewDelegate{
  
  @IBOutlet weak var container: UIView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var scrollview: UIScrollView!{
    didSet{
      scrollview.delegate = self
    }
  }
  var viewModel: AlbumsViewModel!
  class func create(with viewModel: AlbumsViewModel) -> AlbumsViewController {
    let vc = AlbumsViewController.instantiateFromStoryboard()
    vc.viewModel = viewModel
    return vc
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind(to: viewModel)
    viewModel.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  func bind(to viewModel: AlbumsViewModel) {
    viewModel.items.observe(on: self) { [weak self] in self?.updateItems(albums: $0) }
  }
  
  func updateItems(albums: [Album]) {
    let slides: [Slide] = albums.map({ album  in
      return Slide.createSlide(album: album)
    })
    self.setupSlideScrollView(slides: slides)
    self.pageControl.numberOfPages = slides.count
    self.pageControl.currentPage = 0
  }
  
  @IBAction func showItem(_ sender: Any) {
    viewModel.didSelectItem(at: self.pageControl.currentPage)
  }
  
  
  func setupSlideScrollView(slides : [Slide]) {
    scrollview.contentSize = CGSize(width: container.frame.width * CGFloat(slides.count), height: container.frame.height)
    scrollview.isPagingEnabled = true
    scrollview.automaticallyAdjustsScrollIndicatorInsets = false
    scrollview.alwaysBounceVertical = false
    scrollview.alwaysBounceHorizontal = true
    scrollview.isDirectionalLockEnabled = true
    scrollview.showsHorizontalScrollIndicator = false
    for i in 0 ..< slides.count {
      slides[i].frame = CGRect(x: container.frame.width * CGFloat(i), y: 0, width: container.frame.width, height: container.frame.height)
      scrollview.addSubview(slides[i])
    }
    pageControl.pageIndicatorTintColor = .black
    pageControl.currentPageIndicatorTintColor = .gray
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
    pageControl.currentPage = Int(pageIndex)
  }
 
  
}



