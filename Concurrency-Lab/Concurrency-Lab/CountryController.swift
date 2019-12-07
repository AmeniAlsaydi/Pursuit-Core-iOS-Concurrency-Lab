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
        tableView.delegate = self 
        
    }
    func loadData() {
        countries = Country.getCountries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CountryDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("couldnt get detailVC or indexPath")
        }
        
        detailVC.country = countries[indexPath.row]
    }


}

extension CountryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? CountryCell else {
            fatalError("issue with country cell")
        }
        
        let country = countries[indexPath.row]
        
        cell.configureCell(for: country)
        
        return cell
        
        
    }
}

extension CountryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
}
