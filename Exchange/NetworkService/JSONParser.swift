//
//  JSONParser.swift
//  Exchange
//
//  Created by Александр Алгашев on 13.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

class JSONParser {
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> Result<T, Error> {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return Result.success(result)
        } catch {
            return Result.failure(error)
        }
    }
}
