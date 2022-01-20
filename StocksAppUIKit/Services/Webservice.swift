//
//  Webservice.swift
//  StocksAppUIKit
//
//  Created by Mohammad Azam on 1/20/22.
//

import Foundation

enum StocksError: Error {
    case invalidServerResponse
}

class Webservice {
    
    func getStocks(url: URL) async throws -> [Stock] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  throw StocksError.invalidServerResponse
              }
        
        return try JSONDecoder().decode([Stock].self, from: data)
    }
    
}
