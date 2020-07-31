//
//  Double.swift
//  Exchange
//
//  Created by Александр Алгашев on 01.02.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

extension Double {
    func format(_ format: String) -> String {
        String(format: format, self)
    }
}
