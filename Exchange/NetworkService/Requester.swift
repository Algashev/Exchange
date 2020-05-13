//
//  Requester.swift
//  Exchange
//
//  Created by Александр Алгашев on 12.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

class Requester {
    enum RequestError: Error, LocalizedError {
        case unknowned
        case faultStatusCode(_ statusCode: String)
        
        var errorDescription: String? {
            switch self {
            case .unknowned:
                return NSLocalizedString("В ответе сервера отсутствуют данные или ответ нераспознан", comment: "Неизвестная ошибка")
            case .faultStatusCode(let statusCode):
                return NSLocalizedString("Неуспешный код состояния HTTP: \(statusCode)", comment: statusCode)
            }
        }
    }
    
    typealias RequestCompletion = (_ result: Result<Data, Error>) -> ()
    
    static func getJSON(from url: URL, completion: @escaping RequestCompletion) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse
            else {
                let error = RequestError.unknowned
                completion(.failure(error))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(data))
            } else {
                let error = RequestError.faultStatusCode("\(httpResponse.statusCode) - \(httpResponse.localizedStatusCode)")
                completion(.failure(error))
            }
            
        }.resume()
    }
}

