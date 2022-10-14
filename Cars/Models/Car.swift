//
//  Car.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import Foundation

struct Car: Decodable {
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Int
}

//
//{
//   "consList":[
//      "Bad direction"
//   ],
//   "customerPrice":120000.0,
//   "make":"Land Rover",
//   "marketPrice":125000.0,
//   "model":"Range Rover",
//   "prosList":[
//      "You can go everywhere",
//      "Good sound system"
//   ],
//   "rating":3
//},
