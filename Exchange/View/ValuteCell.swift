//
//  ValuteTableViewCell.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import UIKit

final class ValuteCell: UITableViewCell {
    @IBOutlet private weak var charCodeLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    weak var viewModel: CellViewModelType? {
        willSet(viewModel) {
            guard let viewModel else { return }
            
            self.charCodeLabel.text = viewModel.charCode
            self.nameLabel.text = viewModel.name
            self.valueLabel.text = viewModel.value
        }
    }
}
