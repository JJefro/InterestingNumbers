//
//  NetworkManager.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 06/08/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func performRequest(by url: URL?, completion: @escaping (Result<NumberEntity, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {

    func performRequest(by url: URL?, completion: @escaping (Result<NumberEntity, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(NetworkError.unknownURL))
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
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
                completion(self.parseJSON(data: data))
            }
        }
        task.resume()
    }

    private func parseJSON(data: Data) -> Result<NumberEntity, Error> {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(NumberModel.self, from: data)
            return .success(NumberEntity(data: decoderData))
        } catch {
            return .failure(error)
        }
    }
}
