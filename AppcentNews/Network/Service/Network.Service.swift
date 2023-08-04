//
//  Network.Service.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

enum ErrorResponse : String {
    
    case invalidEndpoint = "The end-point is not valid"
    
}

protocol NetworkService {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

extension Network {
 
    final class DefaultService: NetworkService {
        
        func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
            
            // 3
            guard var urlComponent = URLComponents(string: request.url) else {
                let error = NSError(
                    domain: ErrorResponse.invalidEndpoint.rawValue,
                    code: 404,
                    userInfo: nil
                )
                
                return completion(.failure(error))
            }
            
            // 4
            var queryItems: [URLQueryItem] = []
            
            request.queryItems.forEach {
                let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
                urlComponent.queryItems?.append(urlQueryItem)
                queryItems.append(urlQueryItem)
            }
            
            urlComponent.queryItems = queryItems
            
            // 5
            guard let url = urlComponent.url else {
                let error = NSError(
                    domain: ErrorResponse.invalidEndpoint.rawValue,
                    code: 404,
                    userInfo: nil
                )
                
                return completion(.failure(error))
            }
            
            var urlRequest = URLRequest(url: url)
                    urlRequest.httpMethod = request.method.rawValue
                    urlRequest.allHTTPHeaderFields = request.headers
                    
                    // 7
                    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                        if let error = error {
                            return completion(.failure(error))
                        }
                        
                        guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                            return completion(.failure(NSError()))
                        }
                        
                        guard let data = data else {
                            return completion(.failure(NSError()))
                        }
                        
                        do {
                            try completion(.success(request.decode(data)))
                        } catch let error as NSError {
                            completion(.failure(error))
                        }
                    }
                    .resume()
            
        }
        
    }
}