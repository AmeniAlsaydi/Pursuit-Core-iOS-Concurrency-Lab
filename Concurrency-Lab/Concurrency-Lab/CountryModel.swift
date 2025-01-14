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
    let alpha2Code: String
    let capital: String
    
}
struct CurrencyInfo: Decodable {
    let code: String // this is the currency code to be compared to in the exchange API
    let symbol: String
    let name: String
}

extension Country {
    static func getCountries() -> [Country] {
        var countries = [Country]()
        
        guard let fileURL = Bundle.main.url(forResource: "Country", withExtension: "json") else {
            fatalError("couldnt locate json data")
        }
        
        do {
        let data = try Data(contentsOf: fileURL)
        countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            fatalError("failed to load from contents \(error)")
        }
    
        return countries
        
    }
    
}
