//
//  Networker.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class Networker<T: Decodable> {
    typealias NetworkerCompletion = (_ result: Result<T, Error>) -> ()
    
    static func requestData(from url: URL, completion: @escaping NetworkerCompletion) {
        DispatchQueue(label: "algashev.Exchange.requestJSON").async {
            Requester.getJSON(from: url) { (result) in
                switch result {
                case .success(let jsonData):
                    let parsingResult = Parser<T>.decode(jsonData)
                    switch parsingResult {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        Networker.logError(error, url)
                        completion(.failure(error))
                    }
                case .failure(let error):
                    Networker.logError(error, url)
                    completion(.failure(error))
                }
            }
        }
    }
    
    private static func logError(_ error: Error, _ url: URL) {
        print("\(url): \(error.localizedDescription)")
    }
}
