//
//  Valute.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

struct Daily: Codable {
    private let Date: String
    private let PreviousDate: String
    private let PreviousURL: String
    private let Timestamp: String
    private let Valute: [String: Valute]
    
    var date: String { return self.Date }
    var previousDate: String { return self.PreviousDate }
    var previousURL: String { return self.PreviousURL }
    var timestamp: String { return self.Timestamp }
    var valutes: [String: Valute] { return self.Valute }
}

struct Valute: Codable {
    let ID: String
    let NumCode: String
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
}
