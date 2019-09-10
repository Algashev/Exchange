//
//  ValuteNetworkService.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

class ValuteNetworkService {
    private init() {}
    
    static func getValutes(completion: @escaping(GetValuteResponse) -> ()) {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }

        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try GetValuteResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
