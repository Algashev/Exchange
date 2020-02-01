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
        self.charCodeLabel.text = valute.CharCode
        
        let valuteName = valute.Nominal > 1 ? "\(valute.Nominal) \(valute.Name)" : "\(valute.Name)"
        self.nameLabel.text = valuteName
        self.valueLabel.text = String(format: "₽%.2f", valute.Value)
    }
}
