//
//  Stock.swift
//  StocksAppUIKit
//
//  Created by Mohammad Azam on 1/20/22.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
}
