//
//  Valute.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

struct Valute {
    var iD: String
    var numCode: String
    var charCode: String
    var nominal: Int
    var name: String
    var value: Double
    var previous: Double
    
    init?(dictionary: [String: AnyObject]) {
        guard
            let iD = dictionary["ID"] as? String,
            let numCode = dictionary["NumCode"] as? String,
            let charCode = dictionary["CharCode"] as? String,
            let nominal = dictionary["Nominal"] as? Int,
            let name = dictionary["Name"] as? String,
            let value = dictionary["Value"] as? Double,
            let previous = dictionary["Previous"] as? Double
        else { return nil }
        
        self.iD = iD
        self.numCode = numCode
        self.charCode = charCode
        self.nominal = nominal
        self.name = name
        self.value = value
        self.previous = previous
    }
}
