//
//  ExchangeTableViewController.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import UIKit

class ExchangeTableViewController: UITableViewController {
    private var valutes = [Valute]()
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
    
    private func reloadData() {
        ValuteNetworkService.getValutes { (daily) in
            self.valutes = Array(daily.valutes.values).sorted { $0.CharCode < $1.CharCode }
            self.tableView.reloadData()
//            print("Data was reloaded...")
        }
    }

    @IBAction func refreshData(_ sender: Any) {
        self.reloadData()
//        print("Data was refreshed...")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return valutes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype Cell", for: indexPath) as? ValuteCell else { return UITableViewCell() }

//         Configure the cell...
        cell.configure(with: valutes[indexPath.row])

        return cell
    }
}
