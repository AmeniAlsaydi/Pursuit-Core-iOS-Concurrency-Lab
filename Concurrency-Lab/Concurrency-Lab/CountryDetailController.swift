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
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
   
    func updateUI() {
        
         
        guard let theCountry = country else {
            fatalError("no image") }
        nameLabel.text = theCountry.name
        
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
