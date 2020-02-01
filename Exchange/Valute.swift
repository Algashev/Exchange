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
    private let ID: String
    private let NumCode: String
    private let CharCode: String
    private let Nominal: Int
    private let Name: String
    private let Value: Double
    private let Previous: Double
    
    var id: String { return self.ID }
    var numCode: String { return self.NumCode }
    var charCode: String { return self.CharCode }
    var nominal: Int { return self.Nominal }
    var name: String { return self.Name }
    var value: Double { return self.Value }
    var previous: Double { return self.Previous }
}
