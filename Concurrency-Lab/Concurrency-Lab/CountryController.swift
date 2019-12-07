//
//  ViewController.swift
//  Concurrency-Lab
//
//  Created by Amy Alsaydi on 12/6/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class CountryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countries = [Country]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        
    }
    func loadData() {
        countries = Country.getCountries()
    }


}

extension CountryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let country = countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.population.description
        return cell
    }
    
    
}

