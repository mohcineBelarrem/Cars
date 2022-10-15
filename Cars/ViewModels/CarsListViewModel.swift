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

    var selectedModel = ""
    var selectedMake = ""

    var firstCarId : String {
        return cars.first?.id.uuidString ?? ""
    }

    init() {
        self.originalCars = CarService().getCars().map { CarDetailViewModel(car: $0) }
        self.cars = CarService().getCars().map { CarDetailViewModel(car: $0) }
    }

    func filterByMake(_ make: Make) {
        selectedMake = make.id

        if selectedModel.isEmpty {
            cars = originalCars
        }

        if !selectedMake.isEmpty {
            cars = cars.filter { $0.make == make.id }
        }

    }

    func filterByModel(_ model: Model) {
        selectedModel = model.id

        if selectedMake.isEmpty {
            cars = originalCars
        }

        if !selectedModel.isEmpty {
            cars = cars.filter { $0.model == model.id }
        }
    }

    var allMakes: [Make] {

        let cars: [CarDetailViewModel]

        if selectedModel.isEmpty {
            cars = originalCars
        } else {
            cars = originalCars.filter { $0.model == selectedModel }
        }

        return [Make(id: "", displayValue: "Any Make")] + cars.map { Make(id: $0.make, displayValue: $0.make ) }
    }

    var allModels: [Model] {

        let cars: [CarDetailViewModel]

        if selectedMake.isEmpty {
            cars = originalCars
        } else {
            cars = originalCars.filter { $0.make == selectedMake }
        }

        return [Model(id: "", displayValue: "Any Model")] + cars.map { Model(id: $0.model, displayValue: $0.model ) }
    }
}
