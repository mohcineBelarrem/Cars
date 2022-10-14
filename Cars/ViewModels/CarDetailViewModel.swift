//
//  CarDetailViewModel.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import Foundation
import Combine

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


class CarDetailViewModel: ObservableObject {
    @Published var car: Car

    init(car: Car) {
        self.car = car
    }

    var formattedCustomerPrice: String {
        let price = Int(car.customerPrice/1000.0)
        return "Price : \(price)k"
    }

    var formattedMarketPrice: String {
        let price = Int(car.makretPrice/1000.0)
        return "Price : \(price)k"
    }

    var make: String {
        return car.make
    }

    var model: String {
        return car.model
    }

    var rating: Int {
        return car.rating
    }

    var consList: [String] {
        return car.consList
    }

    var prosList: [String] {
        return car.prosList
    }

    var imageName: String {
        return model.replacingOccurrences(of: " ", with: "_")
    }
}
