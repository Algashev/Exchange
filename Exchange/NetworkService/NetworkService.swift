//
//  NetworkService.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class NetworkService {
    static func requestJSON<T: Codable>(from url: URL, completion: @escaping (T?, _ response: HTTPURLResponse?, _ error: String?) -> ()) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completion(nil, response as? HTTPURLResponse, error.localizedDescription)
                return
            }
            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse
            else {
                print("Ошибка не определена \(String(describing: response))")
                completion(nil, nil, String(describing: response))
                return
            }
            if httpResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: data)
                    print("NetworkService status: Success")
                    completion(result, httpResponse, nil)
                } catch {
                    print(error)
                    completion(nil, httpResponse, error.localizedDescription)
                }
            } else {
                print("Ошибка \(httpResponse)")
                completion(nil, httpResponse, "\(httpResponse)")
            }
        }.resume()
    }
}
