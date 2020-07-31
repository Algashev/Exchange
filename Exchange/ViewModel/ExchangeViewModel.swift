//
//  ExchangeViewModel.swift
//  Exchange
//
//  Created by Александр Алгашев on 01.02.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    var numberOfRows: Int { get }
    func cellViewModel(forRowAt indexPath: IndexPath) -> CellViewModelType?
    func reloadData(completion: @escaping() -> ())
}

class ExchangeViewModel: TableViewViewModelType {
    private var valutes = [Valute]()
    var numberOfRows: Int { self.valutes.count }
    
    func cellViewModel(forRowAt indexPath: IndexPath) -> CellViewModelType? {
        guard indexPath.row < self.valutes.count else { return nil }
        let valute = self.valutes[indexPath.row]
        return ValuteCellViewModel(valute)
    }
    
    func reloadData(completion: @escaping() -> ()) {
        Networker.getValutes { [weak self] (daily) in
            self?.valutes = daily.valutes.sorted { $0.charCode < $1.charCode }
            completion()
        }
    }
}
