//
//  FiltersView.swift
//  Cars
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import SwiftUI

struct FiltersView: View {
    var makes: [Make]
    var models: [Model]

    @State var selectedMake: Make
    @State var selectedModel: Model

    var makeFilter : (Make) -> Void
    var modelFilter : (Model) -> Void

    init(
        makes: [Make],
        models: [Model],
        makeFilter: @escaping (Make) -> Void = { _ in },
        modelFilter: @escaping (Model) -> Void = { _ in }
    ) {
        self.makes = makes
        self.models = models
        self.selectedMake = makes.first ?? Make(id: "", displayValue: "Any make")
        self.selectedModel = models.first ?? Model(id: "", displayValue: "Any model")
        self.makeFilter = makeFilter
        self.modelFilter = modelFilter
    }

    var body: some View {
        VStack(alignment: .leading) {

            HStack() {
                Text("Filters")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.init(top: 10, leading: 15, bottom: 0, trailing: 15))

            Menu {
                ForEach(makes, id:\.id) { make in
                    Button(action: {
                        self.selectedMake = make
                        makeFilter(make)
                    }, label: {
                        Text(make.displayValue)
                    })
                }
            } label: {
                HStack {
                    Text(self.selectedMake.displayValue)
                        .fontWeight(.bold)
                        .padding(5)
                    Spacer()
                }
                .foregroundColor(Color.lightGray)
                .background(.white)
                .cornerRadius(5)
                .padding(.init(top: 5, leading: 15, bottom: 15, trailing: 15))
            }


            Menu {
                ForEach(models, id:\.id) { model in
                    Button(action: {
                        self.selectedModel = model
                        modelFilter(model)
                    }, label: {
                        Text(model.displayValue)
                    })
                }
            } label: {
                HStack {
                    Text(self.selectedModel.displayValue)
                        .fontWeight(.bold)
                        .padding(5)
                    Spacer()
                }
                .foregroundColor(Color.lightGray)
                .background(.white)
                .cornerRadius(5)
                .padding(.init(top: 5, leading: 15, bottom: 15, trailing: 15))
            }


        }
        .background(Color.darkGray)
        .cornerRadius(5)
        .padding(15)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {

        let makes = [Make(id: "", displayValue: "Any make"),
                     Make(id: "1", displayValue: "1"),
                     Make(id: "2", displayValue: "2"),
                     Make(id: "3", displayValue: "3")]

        let models = [Model(id: "", displayValue: "Any Model"),
                     Model(id: "4", displayValue: "4"),
                     Model(id: "5", displayValue: "5"),
                     Model(id: "6", displayValue: "6")]

        FiltersView(makes: makes, models: models)
    }
}
