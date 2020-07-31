//
//  HTTPURLResponse.swift
//  Exchange
//
//  Created by Александр Алгашев on 12.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var statusCodeDescription: String {
        "\(self.statusCode) - \(self.localizedStatusCode)"
    }
    
    var localizedStatusCode: String {
        HTTPURLResponse.localizedString(forStatusCode: self.statusCode)
    }
}
