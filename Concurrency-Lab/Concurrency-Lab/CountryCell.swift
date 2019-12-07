//
//  CountryCell.swift
//  Concurrency-Lab
//
//  Created by Amy Alsaydi on 12/7/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopulationLabel: UILabel!
    
    var country: Country?
    
    func configureCell(for country: Country) {
        countryNameLabel.text = country.name
        countryCapitalLabel.text = "Capital: \(country.capital)"
        countryPopulationLabel.text = "Population: \(country.population)"
        
        ImageClient.fetchimage(for: "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png") { [unowned self] (result) in
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.countryFlagImage.image = UIImage(data: image)
                }
            }
        }
        
    }
}
