//
//  ViewModel.swift
//  Week10
//
//  Created by 서동운 on 9/20/23.
//

import Foundation

final class ViewModel {
    
    var photoResultURL = Observable(URL(string: ""))
    var error = Observable("")
    
    func getRandomPhoto() {
        NetworkBasic.shared.requestConvertible(type: PhotoResult.self, router: .random) { result in
            switch result {
            case .success(let _photoResult):
                self.photoResultURL.value = URL(string: _photoResult.urls.thumb)!
            case .failure(let _error):
                self.error.value = _error.errorDescription
            }
        }
    }
    
    func getPhotoDetail(id: String?, completion: @escaping (Result<Photo, sesacError>) -> Void) {
        guard let _id = id else { return }
        NetworkBasic.shared.requestProcess(api: .detail(_id)) { result in
            completion(result)
        }
    }
    
    func searchPhoto(query: String, completion: @escaping (Result<Photo, sesacError>) -> Void) {
        NetworkBasic.shared.requestProcess(api: .search(query)) { result in
            completion(result)
        }
    }
}
