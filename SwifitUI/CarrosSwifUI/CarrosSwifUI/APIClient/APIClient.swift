//
//  APIClient.swift
//  CarrosSwifUI
//
//  Created by Elielton Dutra on 22/10/23.
//

import Foundation
import Combine

class APIClientImpl: APIClient {
    let baseURL: URL
    let session: URLSession
    
    init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func fetch<T: Codable>(endpoint: APIFipe, completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = endpoint.urlRequest else {
            completion(.failure(APIError.decodingError))
            return
        }
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(APIError.decodingError))
            }
        }.resume()
    }
}
