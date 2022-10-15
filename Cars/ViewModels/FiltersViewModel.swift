//
//  FiltersViewModel.swift
//  Cars
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import Foundation
import Combine


class FiltersViewModel: ObservableObject {
    var makes: [Make]
    var models: [Model]

    @Published var selectedMake: Make
    @Published var selectedModel: Model

    private var makeFilter : (Make) -> Void
    private var modelFilter : (Model) -> Void

    init(
        makes: [Make],
        models: [Model],
        selectedMake: Make? = nil,
        selectedModel: Model? = nil,
        makeFilter: @escaping (Make) -> Void = { _ in },
        modelFilter: @escaping (Model) -> Void = { _ in }
    ) {
        self.makes = makes
        self.models = models
        self.selectedMake = selectedMake ?? Make(id: "", displayValue: "Any make")
        self.selectedModel = selectedModel ?? Model(id: "", displayValue: "Any model")
        self.makeFilter = makeFilter
        self.modelFilter = modelFilter
    }

    func filter(using make: Make) {
        self.selectedMake = make
        makeFilter(make)
    }

    func filter(using model: Model) {
        self.selectedModel = model
        modelFilter(model)
    }
}
