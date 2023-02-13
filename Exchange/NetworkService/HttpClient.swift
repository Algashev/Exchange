//
//  HttpClient.swift
//  Exchange
//
//  Created by Александр Алгашев on 12.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

struct HttpClient {
    enum Error: Swift.Error {
        case emptyData
        case unknownResponse
        case wrongStatusCode(_ statusCode: String)
    }
    
    typealias httpResult = (_ result: Result<Data, Swift.Error>) -> Void
    
    static func dataTask(with url: URL, completion: @escaping httpResult) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                let error = Error.emptyData
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = Error.unknownResponse
                completion(.failure(error))
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                completion(.success(data))
            } else {
                let error = Error.wrongStatusCode(httpResponse.statusCodeDescription)
                completion(.failure(error))
            }
            
        }.resume()
    }
}

extension HttpClient.Error: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyData:
            let key = "В ответе сервера отсутствуют данные"
            return NSLocalizedString(key, comment: "Нет данных")
        case .unknownResponse:
            let key = "Ответ сервера не распознан"
            return NSLocalizedString(key, comment: "Неизвестный ответ")
        case .wrongStatusCode(let statusCode):
            let key = "Неуспешный ответ состояния HTTP: \(statusCode))"
            return NSLocalizedString(key, comment: statusCode)
        }
    }
}
