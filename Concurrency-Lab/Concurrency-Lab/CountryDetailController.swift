//
//  CountryDetailController.swift
//  Concurrency-Lab
//
//  Created by Amy Alsaydi on 12/7/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class CountryDetailController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    
    var country: Country?
    var exchange: ExchangeRate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
   
    func updateUI() {
        
         
        guard let theCountry = country, let theExchange = exchange else {
            fatalError("no image") }
        nameLabel.text = theCountry.name
        capitalLabel.text = "Capital: \(theCountry.capital)"
        populationLabel.text = "Population: \(theCountry.population)"
        
        let exchangeRate = theExchange.rates[theCountry.currencies.first?.code ?? " "] ?? 0
        let formatedRate = String(format: "%.0f", exchangeRate)
        let currencyName = theCountry.currencies.first?.name ?? " "
        
        exchangeLabel.text = "1 US Dollar = \(formatedRate) \(currencyName)"
        
        ImageClient.fetchimage(for: "https://www.countryflags.io/\(theCountry.alpha2Code)/flat/64.png") { (result) in
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: image)
                }
            }
        }
         
    
    }

}
