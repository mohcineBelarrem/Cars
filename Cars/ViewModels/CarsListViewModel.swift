//
//  CarsListViewModel.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import Foundation
import Combine


class CarsListViewModel: ObservableObject {
    let originalCars : [CarDetailViewModel]
    @Published var cars = [CarDetailViewModel]()

    var firstCarId : String {
        return cars.first?.id.uuidString ?? ""
    }

    init() {
        self.originalCars = CarService().getCars().map { CarDetailViewModel(car: $0) }
        self.cars = CarService().getCars().map { CarDetailViewModel(car: $0) }
    }

    func filterByMake(_ make: String) {
        guard !make.isEmpty else {
            cars = originalCars
            return
        }
        cars = cars.filter { $0.make == make }
    }

    func filterByModel(_ model: String) {
        guard !model.isEmpty else {
            cars = originalCars
            return
        }
        cars = cars.filter { $0.model == model }
    }

    var allMakes: [String] {
        return originalCars.map { $0.make }
    }

    var allModels: [String] {
        return originalCars.map { $0.model }
    }
}
