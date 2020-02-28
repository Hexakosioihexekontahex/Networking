//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Roman Melnik on 28.02.2020.
//  Copyright © Roman Melnik. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
