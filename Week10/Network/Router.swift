//
//  Router.swift
//  Week10
//
//  Created by 서동운 on 9/20/23.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible, RequestbleAPI {
    
    private var accessKey: String {
        return "yfkuruvTxb_OQrLy8wxu2C07SGZdkDjjbn2b2Vf4c4k"
    }
    
    case random
    case search(String)
    case detail(String)
    
}

extension Router {
    
    private var baseURL: URL {
        return URL(string: "https://api.unsplash.com")!
    }
    
    private var path: String {
        switch self {
        case .random:
            return "/photos/random"
        case .search:
            return "/search/photos"
        case .detail(let id):
            return "/photos/\(id)"
        }
    }
    
    var headers: HTTPHeaders {
        return [HTTPHeader.authorization("Client-ID \(accessKey)")]
    }
    
    var parameter: Parameters? {
        switch self {
        case .search(let query):
            return ["query": query]
        default:
            return nil
        }
    }
    
    var encoding: URLEncoding {
        switch self {
        case .random:
            return .default
        case .search:
            return .queryString
        case .detail:
            return .httpBody
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let request = try URLRequest(url: baseURL.appendingPathComponent(path),
                                     method: method,
                                     headers: headers)
        let encodedRequest = try encoding.encode(request, with: parameter)
        return encodedRequest
    }
}
