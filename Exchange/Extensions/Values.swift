//
//  Values.swift
//  Exchange
//
//  Created by Александр Алгашев on 31.07.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

extension Dictionary.Values {
    var array: Array<Self.Element> { Array(self) }
}
