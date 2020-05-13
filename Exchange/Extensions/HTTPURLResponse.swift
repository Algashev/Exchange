//
//  HTTPURLResponse.swift
//  Exchange
//
//  Created by Александр Алгашев on 12.05.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var localizedStatusCode: String {
        return HTTPURLResponse.localizedString(forStatusCode: self.statusCode)
    }
}
