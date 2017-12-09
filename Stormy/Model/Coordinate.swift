//
//  Coordinate.swift
//  Stormy
//
//  Created by Mohammed Al-Dahleh on 2017-12-09.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
