//
//  CarDetailView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct CarDetailView: View {
    @ObservedObject var car: CarDetailViewModel

    init(car: Car) {
        self.car = CarDetailViewModel(car: car)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
            VStack(alignment: .leading) {
                Text(car.model)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.text)
                Text(car.formattedMarketPrice)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.text)
                Spacer()
                    .frame(height: 10)
                CarRatingView(rating: car.rating)
            }
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {

    let car = Car(
        consList: ["Bad direction"],
        customerPrice: 120000.0,
        make: "Land Rover",
        makretPrice: 125000.0,
        model: "Range Rover",
        prosList: ["You can go everywhere", "Good sound system"],
        rating: 3
    )

        CarDetailView(car: car)
    }
}
