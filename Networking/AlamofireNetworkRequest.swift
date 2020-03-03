//
//  AlamofireNetworkRequest.swift
//  Networking
//
//  Created by Roman Melnik on 03.03.2020.
//  Copyright © 2020 Roman Melnik. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func makeRequest(url: String, completion: @escaping (_ courses: [Course]) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { response in
            
            guard let statusCode = response.response?.statusCode else { return }
            print("statusCode: \(statusCode)")

            switch response.result {
            case .success(let value):
                
                var courses = [Course]()
                
                courses = Course.getArray(from: value) ?? [Course]()
                
                completion(courses)
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
