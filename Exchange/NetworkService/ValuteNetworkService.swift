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
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }

        NetworkService.requestJSON(from: url) { (daily: Daily?, response, error) in
            if let daily = daily {
                DispatchQueue.main.async { completion(daily) }
            }
        }
    }
}
