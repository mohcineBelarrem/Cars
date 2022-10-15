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


class CarDetailViewModel: ObservableObject, Identifiable {
    @Published var car: Car

    let id = UUID()

    init(car: Car) {
        self.car = car
    }

    var formattedCustomerPrice: String {
        let price = Int(car.customerPrice/1000.0)
        return "Price : \(price)k"
    }

    var formattedMarketPrice: String {
        let price = Int(car.marketPrice/1000.0)
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
        return car.consList.filter { !$0.isEmpty }
    }

    var prosList: [String] {
        return car.prosList.filter { !$0.isEmpty }
    }

    var imageName: String {
        return make.replacingOccurrences(of: " ", with: "_") + "_" + model.replacingOccurrences(of: " ", with: "_")
    }
}
