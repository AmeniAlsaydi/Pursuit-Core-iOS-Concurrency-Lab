//
//  CountryModel.swift
//  Concurrency-Lab
//
//  Created by Amy Alsaydi on 12/6/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let region: String
    let population: Int
    let currencies: [CurrencyInfo] // use .first to get the first item in this array.
    let flag: String // use urlSession 
    
}
struct CurrencyInfo: Decodable {
    let name: String
    let symbol: String
}
