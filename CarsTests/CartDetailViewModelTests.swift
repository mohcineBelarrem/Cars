//
//  CartDetailViewModelTests.swift
//  CarsTests
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import XCTest
@testable import Cars

class CartDetailViewModelTests: XCTestCase {

    var mockCarList = CarService().getCars()
    var car : CarDetailViewModel!

    override func setUp() {
        car = CarDetailViewModel(car: mockCarList.first!)
    }

    override func tearDown() {
        car = nil
    }


    func test1() {
        XCTAssertEqual(car.imageName, "Land_Rover_Range_Rover")
        XCTAssertEqual(car.formattedMarketPrice, "Price : 125k")
        XCTAssertEqual(car.formattedCustomerPrice, "Price : 120k")
    }

}
