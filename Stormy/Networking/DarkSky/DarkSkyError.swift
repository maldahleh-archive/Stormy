//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Mohammed Al-Dahleh on 2017-12-09.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case invalidUrl
    case jsonConversionFailure
    case jsonParsingFailure
}
