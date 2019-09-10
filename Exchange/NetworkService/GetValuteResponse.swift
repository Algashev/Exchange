//
//  GetValuteResponse.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

struct GetValuteResponse {
    let valutes: [Valute]
    
    init(json: Any) throws {
        guard
            let jsonDictionary = json as? [String: AnyObject],
            let valutesDictionary = jsonDictionary["Valute"] as? [String: AnyObject]
        else { throw NetworkError.failedGetValuesFromJSON }
        
        var valutes = [Valute]()
        for (_, value) in valutesDictionary {
            guard
                let dictionary = value as? [String: AnyObject],
                let valute = Valute(dictionary: dictionary)
            else { continue }
            valutes.append(valute)
        }
        self.valutes = valutes.sorted(by: { $0.charCode < $1.charCode })
    }
}
