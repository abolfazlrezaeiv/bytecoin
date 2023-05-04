//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    func didUpdateCoinData(_ data: ExchangeRate)
    func didFailWithError(_ error: Error)
}

struct CoinManager {
    var delegate : CoinManagerDelegate? = nil
    
    let apiKey = "6291CC65-41B4-4808-BE41-3C773AC64E7D"
    
    let currencyArray = Constants.currencyArray

    
    func getCoinPrice(for currency: String) {
        performRequest()
        
    }
    
    fileprivate func performRequest() {
        if let url = URL(string: "\(Configuration.baseURL)?apikey=\(apiKey)") {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                }
                if let safeData = data {
                    if let exchangeRate =  self.parseJson(safeData) {
                        self.delegate?.didUpdateCoinData(exchangeRate)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(_ data: Data) -> ExchangeRate? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ExchangeRate.self, from: data)
            let lastPrice = decodedData
            return lastPrice
        } catch {
            self.delegate?.didFailWithError(error)
            return nil
        }
    }
}
