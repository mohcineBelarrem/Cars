//
//  CarDetailView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct CarDetailView: View {
    @ObservedObject var car: CarDetailViewModel
    @Binding var selectedId: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 75)
                VStack(alignment: .leading) {
                    Text(car.model)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.text)
                    Text(car.formattedMarketPrice)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.text)
                    Spacer()
                        .frame(height: 10)
                    CarRatingView(rating: car.rating)
                }
            }

            if selectedId == car.id.uuidString {
                VStack(alignment: .leading) {
                    if !car.prosList.isEmpty {
                        Text("Pros : ")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.text)

                        ForEach(car.prosList, id: \.self) { item in
                            BulletPointView(text: item)
                        }
                    }

                    if !car.consList.isEmpty {
                        Text("Cons : ")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.text)

                        ForEach(car.consList, id: \.self) { item in
                            BulletPointView(text: item)
                        }
                    }

                }.padding(10)
            }
        }.padding(10)
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {

    let car = Car(
        consList: ["Bad direction"],
        customerPrice: 120000.0,
        make: "Land Rover",
        marketPrice: 125000.0,
        model: "Range Rover",
        prosList: ["You can go everywhere", "Good sound system"],
        rating: 3
    )

        CarDetailView(car: CarDetailViewModel(car: car), selectedId: .constant(""))
    }
}
