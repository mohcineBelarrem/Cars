//
//  CarServiceTests.swift
//  CarsTests
//
//  Created by Mohcine Belarrem on 14/10/2022.
//

import XCTest
@testable import Cars

class CarServiceTests: XCTestCase {

    var service: CarService!

    override func setUp() {
        service = CarService()
    }

    override func tearDown() {
         service = nil
    }


    func testDataIsWellRead() {
        let cars = service.getCars()
        XCTAssertEqual(cars.count, 10)
        let car = cars[3]
        XCTAssertEqual(car.model, "GLE coupe")
        XCTAssertEqual(car.make, "Mercedes Benz")
        XCTAssertEqual(car.rating, 2)
        XCTAssertEqual(car.marketPrice, 85900.0)
        XCTAssertEqual(car.customerPrice, 95000.0)
        XCTAssertEqual(car.prosList, [])
        XCTAssertEqual(car.consList, ["You may lose a wheel", "Expensive maintenance"])
    }

}
