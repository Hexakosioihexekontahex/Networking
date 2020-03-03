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
    
    static func makeRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).responseJSON { response in
            print(response)
        }
    }
    
}
