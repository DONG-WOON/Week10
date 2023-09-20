//
//  ViewController.swift
//  Week10
//
//  Created by 서동운 on 9/19/23.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    var id: String?
    
    let imageView = UIImageView()
    let detailButton = UIButton(configuration: .filled())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(detailButton)
        
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.width.equalTo(200)
        }
        
        detailButton.setTitle("Detail", for: .normal)
        
        detailButton.snp.makeConstraints { make in
            make.centerX.equalTo(imageView)
            make.top.equalTo(imageView.snp.bottom).offset(50)
            
            make.width.equalTo(200)
        }
        
        detailButton.addTarget(self, action: #selector(detailButtonDidTapped), for: .touchUpInside)
    }
    
    func getRandomPhoto(completion: @escaping (Result<PhotoResult, NetworkError>) -> Void) {
        NetworkBasic.shared.requestProcess(api: .random) { result in
            completion(result)
        }
    }
    
    func getPhotoDetail(id: String?, completion: @escaping (Result<Photo, NetworkError>) -> Void) {
        guard let _id = id else { return }
        NetworkBasic.shared.requestProcess(api: .detail(_id)) { result in
            completion(result)
        }
    }
    
    func searchPhoto(query: String, completion: @escaping (Result<Photo, NetworkError>) -> Void) {
        NetworkBasic.shared.requestProcess(api: .search(query)) { result in
            completion(result)
        }
    }
    
    @objc func detailButtonDidTapped() {
        
    }
}

