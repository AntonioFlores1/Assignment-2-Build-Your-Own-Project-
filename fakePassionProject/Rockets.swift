//
//  Rockets.swift
//  fakePassionProject
//
//  Created by Pursuit on 1/1/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllRockets: Codable {
    let cost_per_launch: Int
    let success_rate_pct: Int
    let flickr_images: [String]
    let description: String
    let rocket_name: String
}
