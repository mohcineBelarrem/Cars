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
        List(self.viewModel.cars, id: \.id) { car in
           CarDetailView(car: car)
        }
    }
}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        CarsListView(viewModel: CarsListViewModel())
    }
}
