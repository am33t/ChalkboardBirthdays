//
//  BirthdaysResponse.swift
//  BirthdaysApp
//
//  Created by Amit Tandel on 18/01/21.
//

import Foundation

struct BirthdaysResponse: Codable {
    let results: [Result]?
    let info: Info?
    
    struct Info: Codable {
        let seed: String?
        let results, page: Int?
        let version: String?
    }

    struct Result: Codable {
        let name: Name?
        let dob: Dob?
    }

    struct Dob: Codable {
        let date: String?
        let age: Int?
    }

    struct Name: Codable {
        let title: String?
        let first, last: String?
    }
}

