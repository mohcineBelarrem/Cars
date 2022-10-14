//
//  CarRatingView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import SwiftUI

struct CarRatingView: View {
    var rating: Int

    var body: some View {
        HStack {
            ForEach(0..<rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.specialOrange)
                    .font(.caption)
            }
        }
    }
}

struct CarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        CarRatingView(rating: 5)
    }
}
