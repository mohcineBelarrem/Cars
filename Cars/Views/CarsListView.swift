//
//  CarsListView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct CarsListView: View {
    @ObservedObject var viewModel: CarsListViewModel
    @State var selectedCarId: String
    @State var selectedMake : Make?
    @State var selectedModel : Model?

    init(viewModel: CarsListViewModel) {
        self.viewModel = viewModel
        selectedCarId = viewModel.firstCarId
    }

    var body: some View {
        List() {

            let filtersViewModel = FiltersViewModel(
                makes: viewModel.allMakes,
                models: viewModel.allModels,
                selectedMake: selectedMake,
                selectedModel: selectedModel,
                makeFilter: { make in
                    viewModel.filterByMake(make)
                    selectedMake = make
                    selectedCarId = viewModel.firstCarId
                },
                modelFilter: { model in
                    viewModel.filterByModel(model)
                    selectedModel = model
                    selectedCarId = viewModel.firstCarId
                }
            )
            FiltersView(viewModel: filtersViewModel)

            ForEach(self.viewModel.cars, id: \.id) { car in
                Button(action: {
                    print("selecting \(car.id)")
                    self.selectedCarId = car.id.uuidString
                }) {
                    VStack() {
                        HStack() {
                            CarDetailView(car: car, selectedId: $selectedCarId)
                            Spacer()
                        }
                        SeparatorView()
                            .background(.white)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.lightGray)
            }
        }
        .listStyle(.plain)
        .background(Color.white)
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView(viewModel: CarsListViewModel())
    }
}
