//
//  StockListViewController.swift
//  StocksAppUIKit
//
//  Created by Mohammad Azam on 1/20/22.
//

import Foundation
import UIKit

class StockListViewController: UITableViewController {
    
    private let vm = StockListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        Task {
            await populateStocks()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Stocks"
        tableView.register(StockCell.self, forCellReuseIdentifier: "StockCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.stocks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as? StockCell else {
            fatalError("StockCell is not defined!")
        }
        
        let stock = vm.stocks[indexPath.row]
        cell.configure(stock)
        
        return cell
    }
    
    private func populateStocks() async {
        await vm.populateStocks(url: Constants.Urls.allStocks)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
        
    }
}
