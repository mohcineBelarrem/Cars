//
//  CarsListViewModelTests.swift
//  CarsTests
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import XCTest
@testable import Cars

class CarsListViewModelTests: XCTestCase {

    var viewModel : CarsListViewModel!

    override func setUp() {
        viewModel = CarsListViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }


    func test_FilteringByMake_Will_only_Display_Car_Models_with_TheSame_Make() {
        viewModel.filterByMake(Make(id: "Alpine", displayValue: "Alpine"))

        XCTAssertEqual(viewModel.cars.count, 1)
        XCTAssertEqual(viewModel.cars.first?.make, "Alpine")
        XCTAssertEqual(viewModel.cars.first?.model, "Roadster")
        XCTAssertEqual(viewModel.allModels.count, 2)
    }

    func test_FilteringBy_Model_Will_only_Display_Car_Makes_for_TheSame_Model() {
        viewModel.filterByModel(Model(id: "Range Rover", displayValue: "Range Rover"))

        XCTAssertEqual(viewModel.cars.count, 1)
        XCTAssertEqual(viewModel.cars.first?.make, "Land Rover")
        XCTAssertEqual(viewModel.cars.first?.model, "Range Rover")
        XCTAssertEqual(viewModel.allMakes.count, 2)
    }


    func test_CrossFilters() {
        viewModel.filterByModel(Model(id: "Range Rover", displayValue: "Range Rover"))

        XCTAssertEqual(viewModel.cars.count, 1)
        XCTAssertEqual(viewModel.cars.first?.make, "Land Rover")
        XCTAssertEqual(viewModel.cars.first?.model, "Range Rover")
        XCTAssertEqual(viewModel.allMakes.count, 2)

        viewModel.filterByMake(Make(id: "", displayValue: "Any Make"))

        XCTAssertEqual(viewModel.cars.count, 1)
        XCTAssertEqual(viewModel.cars.first?.make, "Land Rover")
        XCTAssertEqual(viewModel.cars.first?.model, "Range Rover")
        XCTAssertEqual(viewModel.allMakes.count, 2)
    }

}
