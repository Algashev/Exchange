//
//  NetworkService.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    func requestJSON(from url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse
            else {
                print("Ошибка не определена \(String(describing: response))")
                return
            }
            if httpResponse.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let valutes = try decoder.decode(Daily.self, from: data)
                    DispatchQueue.main.async {
                        completion(valutes)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print("Ошибка \(httpResponse)")
            }
        }.resume()
    }
}
