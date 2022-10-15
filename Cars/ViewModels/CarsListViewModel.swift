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
        cars = originalCars.filter { $0.make.includes(make.id) && $0.model.includes(selectedModel) }
    }

    func filterByModel(_ model: Model) {
        selectedModel = model.id
        cars = originalCars.filter { $0.model.includes(model.id) && $0.make.includes(selectedMake) }
    }

    var allMakes: [Make] {

        let cars: [CarDetailViewModel]

        if selectedModel.isEmpty {
            cars = originalCars
        } else {
            cars = originalCars.filter { $0.model == selectedModel }
        }

        let makes = Array(Set(cars.map { Make(id: $0.make, displayValue: $0.make ) }))

        return [Make(id: "", displayValue: "Any Make")] + makes
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
