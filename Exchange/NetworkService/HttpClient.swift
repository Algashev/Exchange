//
//  HttpClient.swift
//  Exchange
//
//  Created by Александр Алгашев on 12.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

enum HttpError: Error, LocalizedError, Equatable {
    case emptyData
    case unknownResponse
    case wrongStatusCode(_ statusCode: String)
    
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

class HttpClient {
    
    typealias httpResult = (_ result: Result<Data, Error>) -> Void
    
    static func getJSON(from url: URL, completion: @escaping httpResult) {
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = HttpError.emptyData
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = HttpError.unknownResponse
                completion(.failure(error))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(data))
            } else {
                let error = HttpError.wrongStatusCode("\(httpResponse.statusCode) - \(httpResponse.localizedStatusCode)")
                completion(.failure(error))
            }
            
        }.resume()
    }
}

