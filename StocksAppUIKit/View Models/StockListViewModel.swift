//
//  StockListViewModel.swift
//  StocksAppUIKit
//
//  Created by Mohammad Azam on 1/20/22.
//

import Foundation

class StockListViewModel {
    
    private(set) var stocks: [StockViewModel] = []
    
    func populateStocks(url: URL) async {
        
        do {
            let stocks = try await Webservice().getStocks(url: url)
            self.stocks = stocks.map(StockViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
}

struct StockViewModel {
    
    private let stock: Stock
    
    init(stock: Stock) {
           self.stock = stock
    }
    
    var symbol: String {
        stock.symbol
    }
    
    var description: String {
        stock.description
    }
    
    var price: Double {
        stock.price
    }
}
