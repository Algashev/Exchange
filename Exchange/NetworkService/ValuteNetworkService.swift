//
//  ValuteNetworkService.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class ValuteNetworkService {
    static func getValutes(completion: @escaping(Daily) -> ()) {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.j") else { return }

        Networker<Daily>.requestData(from: url) { (result) in
            switch result {
            case .success(let daily):
                DispatchQueue.main.async { completion(daily) }
            case .failure(let error):
                break
            }
        }
    }
}
