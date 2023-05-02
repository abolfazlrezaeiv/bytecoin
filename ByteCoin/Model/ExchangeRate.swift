//
//  ExchangeRate.swift
//  ByteCoin
//
//  Created by Abolfazl-Atena on 2/11/1402 AP.
//  Copyright © 1402 AP The App Brewery. All rights reserved.
//

import Foundation
struct ExchangeRate : Decodable {
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Double
}

