//
//  Configuration.swift
//  ByteCoin
//
//  Created by Saeed Rahmatolahi on 4/5/2566 BE.
//  Copyright © 2566 BE The App Brewery. All rights reserved.
//

import Foundation

struct Configuration {
    static var baseURL: String {
        guard let path = Bundle.main.path(forResource: "Configurations", ofType: "plist") else { return "" }
        guard let configDictionary = NSDictionary(contentsOfFile: path) else { return "" }
        guard let baseUrl = configDictionary["baseURL"] as? String else { return "" }
        return baseUrl
    }
}
