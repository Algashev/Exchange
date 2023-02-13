//
//  ValuteCellViewModel.swift
//  Exchange
//
//  Created by Александр Алгашев on 01.02.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

protocol CellViewModelType: AnyObject {
    var charCode: String { get }
    var name: String { get }
    var value: String { get }
}

final class ValuteCellViewModel: CellViewModelType {
    private let valute: Valute
    
    var charCode: String { self.valute.charCode }
    var name: String {
        let nominal = self.valute.nominal
        let name = self.valute.name
        return nominal > 1 ? "\(nominal) \(name)" : name
    }
    var value: String { self.valute.value.format("₽%.2f") }
    
    init(_ valute: Valute) {
        self.valute = valute
    }
}
