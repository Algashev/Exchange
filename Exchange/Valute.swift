//
//  Valute.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

struct Daily: Decodable {
    let date: String
    let previousDate: String
    let previousURL: String
    let timestamp: String
    private let valute: [String: Valute]
    var valutes: [Valute] { self.valute.values.array }
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case previousURL = "PreviousURL"
        case timestamp = "Timestamp"
        case valute = "Valute"
    }
}

struct Valute: Codable {
    let id: String
    let numCode: String
    let charCode: String
    let nominal: Int
    let name: String
    let value: Double
    let previous: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numCode = "NumCode"
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
