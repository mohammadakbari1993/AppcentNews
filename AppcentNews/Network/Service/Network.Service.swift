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
            
  
            guard var urlComponent = URLComponents(string: request.url) else {
                let error = NSError(
                    domain: ErrorResponse.invalidEndpoint.rawValue,
                    code: 404,
                    userInfo: nil
                )
                
                return completion(.failure(error))
            }
            
     
            var queryItems: [URLQueryItem] = []
            
            request.queryItems.forEach {
                let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
                urlComponent.queryItems?.append(urlQueryItem)
                queryItems.append(urlQueryItem)
            }
            
            urlComponent.queryItems = queryItems
            
   
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
                        
                        guard let data = data else {
                            return completion(.failure(NSError()))
                        }

                        guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                            
                            do {
                                let decoder = JSONDecoder()
                                guard let response = try? decoder.decode(Service.Response.Common.ServerError.self, from: data).map() else {
                                    return completion(.failure(NSError()))
                                }
                                let error = NSError(
                                    domain: response.message,
                                    code: -404,
                                    userInfo: nil
                                )
                                return completion(.failure(error))
                            }
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
