//
//  NetworkBasic.swift
//  Week10
//
//  Created by 서동운 on 9/19/23.
//

import Foundation
import Alamofire

enum NetworkError: Int, Error {
    case unauthorized = 401
    case notFound = 404
    case invalidServer = 500
    case missingParameter = 400
    
    var errorDescription: String {
        switch self {
        case .unauthorized:
            return "인증 정보가 없습니다"
        case .notFound:
            return "The requested resource doesn’t exist"
        case .invalidServer:
            return "서버 점검중입니다."
        case .missingParameter:
            return "검색어를 입력해주세요"
        }
    }
}
protocol Network {
    associatedtype Shared
    
    static var shared: Shared { get }
}


final class NetworkBasic: Network {
    typealias Shared = NetworkBasic
    
    static var shared: Shared = NetworkBasic()

    private init() { }
    
    func requestProcess<U: Codable>(api: API, completion: @escaping (Result<U, NetworkError>) -> Void) {
        AF.request(api, method: api.method, parameters: api.parameter, encoding: api.encoding, headers: api.headers).validate().responseDecodable(of: U.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure:
                guard let statusCode = response.response?.statusCode else { return }
                guard let _error = NetworkError(rawValue: statusCode) else { return }
                completion(.failure(_error))
            }
        }
    }
}
