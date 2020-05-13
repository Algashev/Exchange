//
//  Parser.swift
//  Exchange
//
//  Created by Александр Алгашев on 13.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

class Parser<T: Decodable> {
    static func decode(_ data: Data) -> Result<T, Error> {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return Result.success(result)
        } catch {
            return Result.failure(error)
        }
    }
}
