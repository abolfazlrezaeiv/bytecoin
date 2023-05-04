//
//  Double+Extensions.swift
//  ByteCoin
//
//  Created by Saeed Rahmatolahi on 4/5/2566 BE.
//  Copyright © 2566 BE The App Brewery. All rights reserved.
//

import Foundation

extension Double {
    var roundWithDecimals: String {
        return String(format: "%.2f", self)
    }
}
