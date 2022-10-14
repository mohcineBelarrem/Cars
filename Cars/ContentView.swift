//
//  ContentView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var carsListViewModel = CarsListViewModel()

    var body: some View {
         CarsListView(viewModel: carsListViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
