//
//  CarsListViewModel.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import Foundation
import Combine


class CarsListViewModel: ObservableObject {
    @Published var cars = [CarDetailViewModel]()

    init() {
        self.cars = CarService().getCars().map { CarDetailViewModel(car: $0) }
    }
}
