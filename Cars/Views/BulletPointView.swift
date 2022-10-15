//
//  BulletPointView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import SwiftUI

struct BulletPointView: View {
    var text: String
    var body: some View {
        HStack() {
            Circle()
                .fill(Color.specialOrange)
                .frame(width: 8, height: 8)
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
    }
}

struct BulletPointView_Previews: PreviewProvider {
    static var previews: some View {
        BulletPointView(text: "Bla bla bla bla")
    }
}
