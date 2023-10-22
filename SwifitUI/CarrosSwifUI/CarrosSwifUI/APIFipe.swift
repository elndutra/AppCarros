//
//  APIFipe.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import Foundation

protocol APIFipe {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum FipeAPI {
    case getNews
}

extension FipeAPI: APIFipe {

    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"

        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
