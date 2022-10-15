//
//  SeparatorView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .fill(Color.specialOrange)
            .frame(height: 2)
            .padding(15)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
