//
//  Decodable.swift
//  Exchange
//
//  Created by Александр Алгашев on 31.07.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

extension Decodable {
    init(decoding data: Data, decoder: JSONDecoder) throws {
        self = try decoder.decode(Self.self, from: data)
    }
}
