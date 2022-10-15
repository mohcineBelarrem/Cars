//
//  CarsListView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct CarsListView: View {
    var viewModel: CarsListViewModel

    var body: some View {
        List() {
            ForEach(self.viewModel.cars, id: \.id) { car in
                Button(action: { print(car.id) }) {
                    VStack() {
                        HStack() {
                            CarDetailView(car: car, isSelected: true)
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
