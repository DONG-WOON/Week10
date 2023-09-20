//
//  ViewModel.swift
//  Week10
//
//  Created by 서동운 on 9/20/23.
//

import Foundation

final class ViewModel {
    var id: String?
    
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
}
