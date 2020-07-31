//
//  Networker.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class Networker {
    typealias Completion<T: Decodable> = (_ result: Result<T, Error>) -> ()
    
    static private func request<T: Decodable>(
        _ type: T.Type,
        from url: URL,
        completion: @escaping Completion<T>)
    {
        HttpClient.dataTask(with: url) { (result) in
            switch result {
            case .success(let jsonData):
                do {
                    let decoder = JSONDecoder()
                    let result = try T(decoding: jsonData, decoder: decoder)
                    completion(.success(result))
                } catch {
                    Networker.logError(error, url)
                    completion(.failure(error))
                }
            case .failure(let error):
                Networker.logError(error, url)
                completion(.failure(error))
            }
        }
    }
    
    private static func logError(_ error: Error, _ url: URL) {
        print("\(url): \(error.localizedDescription)")
    }
}

extension Networker {
    static func getValutes(completion: @escaping(Daily) -> ()) {
        let path = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: path) else { return }

        Networker.request(Daily.self, from: url) { (result) in
            switch result {
            case .success(let daily):
                DispatchQueue.main.async { completion(daily) }
            case .failure(let error):
                print(error)
            }
        }
    }
}
