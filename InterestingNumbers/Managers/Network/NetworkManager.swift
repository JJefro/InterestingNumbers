//
//  NetworkManager.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 06/08/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func perform<Request: DataRequest>(request: Request, completion: @escaping (Result<Request.Entity, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {

    func perform<Request: DataRequest>(request: Request, completion: @escaping (Result<Request.Entity, Error>) -> Void) {
        guard let url = request.url else {
            completion(.failure(NetworkError.unknownURL))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error { completion(.failure(error)) }
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(NetworkError.unknownServerResponse))
                    return
                }
                guard let data = data else {
                    completion(.failure(NetworkError.noDataReceived))
                    return
                }
                guard response.statusCode / 100 == 2 else {
                    completion(.failure(NetworkError.unknownStatusCode))
                    return
                }
                completion(request.decode(data))
            }
        }
        task.resume()
    }
}
