//
//  JSONDownloader.swift
//  Stormy
//
//  Created by Mohammed Al-Dahleh on 2017-12-09.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import Foundation

typealias JSON = [String: AnyObject]
typealias CompletionHandler = (JSON?, DarkSkyError?) -> Void

class JSONDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: URLSessionConfiguration.default)
    }
    
    func jsonTaskWith(request: URLRequest, completionHandler completion: @escaping CompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode != 200 {
                completion(nil, .responseUnsucessful)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                completion(json, nil)
            } catch {
                completion(nil, .jsonConversionFailure)
            }
        }
        
        return task
    }
}
