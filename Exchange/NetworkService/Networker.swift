//
//  Networker.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

struct Networker {
    typealias Completion<T: Decodable> = (_ result: Result<T, Error>) -> Void
    
    static private func request<T: Decodable>(
        with url: URL,
        completion: @escaping Completion<T>)
    {
        HttpClient.dataTask(with: url) { result in
            do {
                let data = try result.get()
                let decoder = JSONDecoder()
                let result = try T(decoding: data, decoder: decoder)
                completion(.success(result))
            } catch {
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
    static func getValutes(completion: @escaping (Daily) -> Void) {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: urlString) else { return }

        Networker.request(with: url) { (result: Result<Daily, Error>) in
            switch result {
            case let .success(daily):
                DispatchQueue.main.async { completion(daily) }
            case let .failure(error):
                print(error)
            }
        }
    }
}
