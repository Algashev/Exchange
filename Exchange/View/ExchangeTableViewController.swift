//
//  ExchangeTableViewController.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import UIKit

class ExchangeTableViewController: UITableViewController {
    private var viewModel: TableViewViewModelType = ExchangeViewModel()
    private var timer = RepeatingTimer(timeInterval: 30)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.reloadData()
        self.timer.eventHandler = { [unowned self] in
//            print("Timer Fired")
            self.reloadData()
        }
        self.timer.resume()
    }

    @IBAction func refreshData(_ sender: Any) {
        self.reloadData()
//        print("Data was refreshed...")
    }
    
    private func reloadData() {
        self.viewModel.reloadData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype Cell", for: indexPath) as? ValuteCell else { return UITableViewCell() }

        let cellViewModel = self.viewModel.cellViewModel(ForRowAt: indexPath)
        cell.viewModel = cellViewModel

        return cell
    }
}
