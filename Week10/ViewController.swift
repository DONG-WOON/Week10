//
//  ViewController.swift
//  Week10
//
//  Created by 서동운 on 9/19/23.
//

import UIKit
import SnapKit
import Kingfisher

final class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        view.minimumZoomScale = 0.8
        view.maximumZoomScale = 4
        
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        view.delegate = self
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureGesture()
        
        viewModel.getRandomPhoto { result in
            switch result {
            case .success(let success):
                self.imageView.kf.setImage(with: URL(string: success.urls.thumb))
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    private func configureViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.width.equalTo(200)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(scrollView)
        }
    }
    
    private func configureGesture() {
        let tapG = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tapG.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tapG)
    }
    
    @objc func detailButtonDidTapped() {
        
    }
    
    @objc func doubleTapGesture() {
        if scrollView.zoomScale == 2.0 {
            scrollView.setZoomScale(1, animated: true)
        } else {
            scrollView.setZoomScale(2.0, animated: true)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
