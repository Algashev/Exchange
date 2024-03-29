//
//  UITableView.swift
//  ListOfUsers
//
//  Created by Александр Алгашев on 15.02.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: "\(cellClass.self)", for: indexPath)
    }
}
