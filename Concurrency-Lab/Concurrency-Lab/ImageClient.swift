//
//  ImageClient.swift
//  Concurrency-Lab
//
//  Created by Amy Alsaydi on 12/7/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

enum AppError : Error{
    case badURL(String)
    case networkClientError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
}


struct ImageClient {
  
    
    static func fetchimage(for urlString: String, completion: @escaping(Result<Data, AppError>)->()){
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
                return
            }
            
            if let data = data {
                dump(data)
                completion(.success(data))
            }
        }
        dataTask.resume()
    }
}
