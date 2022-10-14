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
        XCTAssertEqual(cars.count, 4)
        XCTAssertEqual(cars.last?.model, "GLE coupe")
        XCTAssertEqual(cars.last?.make, "Mercedes Benz")
        XCTAssertEqual(cars.last?.rating, 2)
        XCTAssertEqual(cars.last?.marketPrice, 85900.0)
        XCTAssertEqual(cars.last?.customerPrice, 95000.0)
        XCTAssertEqual(cars.last?.prosList, [])
        XCTAssertEqual(cars.last?.consList, ["You may lose a wheel", "Expensive maintenance"])
    }

}
