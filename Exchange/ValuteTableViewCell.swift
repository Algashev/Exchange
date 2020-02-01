//
//  ValuteTableViewCell.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import UIKit

class ValuteTableViewCell: UITableViewCell {
    @IBOutlet private weak var charCodeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    func configure(with valute: Valute) {
//        self.charCodeLabel.text = valute.charCode
//        
//        let valuteName = valute.nominal > 1 ? "\(valute.nominal) \(valute.name)" : "\(valute.name)"
//        self.nameLabel.text = valuteName
//        self.valueLabel.text = String(format: "₽%.2f", valute.value)
    }
}
