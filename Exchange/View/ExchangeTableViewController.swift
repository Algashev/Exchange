//
//  ExchangeTableViewController.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import UIKit

final class ExchangeTableViewController: UITableViewController {
    private var viewModel: TableViewViewModelType = ExchangeViewModel()
    private var timer = RepeatingTimer(timeInterval: 30)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.reloadData()
        self.timer.eventHandler = { [weak self] in self?.reloadData() }
        self.timer.resume()
    }

    @IBAction private func refreshData(_ sender: Any) {
        self.reloadData()
        self.timer.reset()
        self.timer.resume()
    }
    
    private func reloadData() {
        self.viewModel.reloadData { [weak self] in
            self?.tableView.reloadSections(IndexSet([0]), with: .automatic)
        }
    }
}

// MARK: Table view data source

extension ExchangeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(ValuteCell.self, for: indexPath)
        let cell = reusableCell as? ValuteCell
        guard let cell else { return reusableCell }
        
        let cellViewModel = self.viewModel.cellViewModel(forRowAt: indexPath)
        cell.viewModel = cellViewModel

        return cell
    }
}
